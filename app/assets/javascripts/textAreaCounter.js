	
		var info;
		$(document).ready(function(){
			var options = {
				'maxCharacterSize': -2,
				'originalStyle': 'originalTextareaInfo',
				'warningStyle' : 'warningTextareaInfo',
				'warningNumber': 40
			};
			$('#testTextarea').textareaCount(options);

			var options2 = {
					'maxCharacterSize': 200,
					'originalStyle': 'originalTextareaInfo',
					'warningStyle' : 'warningTextareaInfo',
					'warningNumber': 40,
					'displayFormat' : '#input/#max | #words words'
			};
			$('#testTextarea2').textareaCount(options2);

			var options3 = {
					'maxCharacterSize': 200,
					'originalStyle': 'originalTextareaInfo',
					'warningStyle' : 'warningTextareaInfo',
					'warningNumber': 40,
					'displayFormat' : '#left Characters Left / #max'
			};
			$('#testTextarea3').textareaCount(options3, function(data){
				$('#showData').html(data.input + " characters input. <br />" + data.left + " characters left. <br />" + data.max + " max characters. <br />" + data.words + " words input.");
			});
		});