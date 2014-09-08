module EventsHelper
  def display_if(test_environment)
    return ''if test_environment
    'display:none;'
  end
end
