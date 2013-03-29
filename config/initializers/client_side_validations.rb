# ClientSideValidations Initializer


#Uncomment the following block if you want each input field to have the validation messages attached.
 ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
   unless html_tag =~ /^<label/
     %{<div class="field_with_errors">#{html_tag}<span class="input-error" data-original-title=""> Erro <i class="icon-exclamation-sign"></i>#{instance.error_message.first}</span></div>}.html_safe
   else
     %{<div class="field_with_errors">#{html_tag}</div>}.html_safe
   end
 end
