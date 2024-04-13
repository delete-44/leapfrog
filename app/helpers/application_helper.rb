module ApplicationHelper
  def flash_classes(type)
    case type.to_sym
    when :notice
      "bg-green-100 border-green-300"
    when :alert
      "bg-orange-100 border-orange-300"
    when :error
      "bg-red-200 border-red-300"
    else
      "bg-gray-100 border-gray-300"
    end
  end
end
