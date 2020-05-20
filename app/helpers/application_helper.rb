module ApplicationHelper
    def glyphicon(icon, text)
        raw "<span class='glyphicon glyphicon-#{icon}' aria-hidden='true'></span> #{text}"
    end
end
