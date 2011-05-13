/* DO NOT MODIFY. This file was compiled Thu, 12 May 2011 18:54:21 GMT from
 * /Users/shreya/work/coffee/node/coffee-demo/app/coffeescripts/post.coffee
 */

(function() {
  var Post;
  Post = {
    buildFields: function(jObj, model) {
      Post.incrementId(jObj, model);
      Post.incrementName(jObj, model);
      return Post.clearValues(jObj);
    },
    clearValues: function(jObj) {
      if (jObj.is('input')) {
        return jObj.removeAttr("value");
      } else if (jObj.is('textarea')) {
        return jObj.html("");
      }
    },
    incrementId: function(jObj, model) {
      var newId, oldId, splitId;
      oldId = jObj.attr('id');
      splitId = oldId.split('_');
      splitId[3] = parseInt(splitId[3], 10) + 1;
      newId = splitId.join('_');
      jObj.attr('id', newId);
      return $('label[for=' + oldId + ']:last').attr('for', newId);
    },
    incrementName: function(jObj, model) {
      var inputName, splitName;
      inputName = jObj.attr('name');
      splitName = inputName.split(/\]\[/);
      splitName[1] = parseInt(splitName[1], 10) + 1;
      return jObj.attr('name', splitName.join("]["));
    }
  };
  $(function() {
    $('.section:last').after('<a href="#">Add another section<a/><br/>');
    return $('a[href=#]').click(function() {
      $(this).before($('.section:last').clone());
      $('.section:last input, .section:last textarea, .section:last select').each(function() {
        return Post.buildFields($(this), 'Section');
      });
      return false;
    });
  });
}).call(this);
