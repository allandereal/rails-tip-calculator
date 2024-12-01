module ApplicationHelper
  def form_number_input(form, field, has_icon: false, options: {})
    left_padding = has_icon ? "pl-8" : "pl-2"
    error_class = form.object.errors[field].any? ? " ring-2 ring-red-400 " : ""

    options[:class] = error_class + left_padding + " text-right text-xl text-teal-800 font-bold w-full pr-4 py-2 placeholder-gray-400 bg-gray-100 rounded-md border border-gray-100 focus:outline-none focus:border-teal-400 focus:ring-1 focus:ring-teal-400 " + (options[:class] || "")

    form.number_field(field, **options)
  end

  def money_format(amount)
    "%.2f" % ((amount * 100).floor / 100.0)
  end
end
