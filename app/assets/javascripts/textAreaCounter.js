	
		var info;
		$(document).ready(function(){
			
			var options2 = {
					'maxCharacterSize': 140,
					'originalStyle': 'originalTextareaInfo',
					'warningStyle' : 'warningTextareaInfo',
					'warningNumber': 40,
					'displayFormat' : '#input/#max characters'
			};
			$('#micropostTextArea').textareaCount(options2);

		});