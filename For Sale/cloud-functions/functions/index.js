let functions = require('firebase-functions')
let admin = require('firebase-admin')
admin.initializeApp(functions.config().firebase)

exports.announceProduct = functions.database
	.ref('products/{productId}')
	.onCreate(event => {
		let product = event.data.val()
		sendNotification(product)
	})

function sendNotification(product) {
	let title = product.title
	let cost = product.cost

	let payload = {
		notification: {
			title: 'New Stuff Mang',
			body: title + ' for ' + cost,
			sound: 'default'
		}
	}
	console.log(payload);

	let topic = 'newProducts'
	admin.messaging().sendToTopic(topic, payload)
}