module GitLeft
  class KeyParser
    def initialize(input)
      @input = input
    end

    def action
      case @input
      when "h" 
        :delete
      when "l"
        :skip
      else
        :quit
      end
    end
  end
end
