App.room = App.cable.subscriptions.create "RoomChannel",
	connected: ->

	disconnected: ->

	received: (data) ->
		alert(data['message'])

	speak: (message) ->
		@perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
	if event.keyCode is 13
		App.room.speak event.target.value
		event.target.value = ''
		event.preventDefault()