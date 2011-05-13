Post = {
	buildFields: (jObj, model) ->
		Post.incrementId(jObj, model) 
		Post.incrementName(jObj, model) 
		Post.clearValues(jObj)   
  
	clearValues: (jObj) ->
		if (jObj.is('input'))
			jObj.removeAttr("value")         
		else if (jObj.is('textarea')) 
			jObj.html("")
  
	incrementId: (jObj, model) ->
		oldId = jObj.attr('id') 
		splitId = oldId.split('_') 

		splitId[3] = parseInt(splitId[3], 10) + 1  
			
		newId = splitId.join('_') 
		jObj.attr('id', newId) 
		$('label[for=' + oldId + ']:last').attr('for', newId) 
	
  
	incrementName : (jObj, model) ->
		inputName = jObj.attr('name')       
		splitName = inputName.split(/\]\[/) 
		splitName[1] = parseInt(splitName[1], 10) + 1       
    
		jObj.attr('name', splitName.join("]["))   
} 


$ ->
  $('.section:last').after('<a href="#">Add another section<a/><br/>') 

  $('a[href=#]').click ->
    $(this).before($('.section:last').clone()) 
    
    $('.section:last input, .section:last textarea, .section:last select').each ->
      Post.buildFields($(this), 'Section') 
    
    # $('.section:last input[type=hidden]').remove() 
    return false 
