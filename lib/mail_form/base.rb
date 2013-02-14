module MailForm
  class Base
    include ActiveModel::AttributeMethods

    attribute_method_prefix 'clear_'

    def self.attributes(*names)
      attr_accessor *names
      define_attribute_methods names
    end

    protected
    # Since we declared a "clear_" prefix, it expects to have a
    # "clear_attribute" method defined.
    def clear_attribute(attribute)
      send("#{attribute}=", nil)
    end
  end
end