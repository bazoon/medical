// ...
  'SimpleForm::FormBuilder': {
    // ...
  },
  'BootstrapFormBuilder': {
    add: function(element, settings, message) {
      if (element.data('valid') !== false) {
        var wrapper = element.closest(settings.wrapper_tag);
        wrapper.addClass(settings.wrapper_error_class);
        var errorElement = $('<' + settings.error_tag + ' class="' + settings.error_class + '">' + message + '</' + settings.error_tag + '>');
        wrapper.append(errorElement);
      } else {
        element.parent().find(settings.error_tag + '.' + settings.error_class).text(message);
      }
    },
    remove: function(element, settings) {
      var wrapper = element.closest(settings.wrapper_tag + '.' + settings.wrapper_error_class);
      wrapper.removeClass(settings.wrapper_error_class);
      var errorElement = wrapper.find(settings.error_tag + '.' + settings.error_class);
      errorElement.remove();
    }
  },
  'Formtastic::SemanticFormBuilder': {
    // ...
  }
// ...
