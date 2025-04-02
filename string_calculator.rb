class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter, numbers = parse_custom_delimiter(numbers)
    else
      delimiter = /,|\n/
    end

    num_list = numbers.split(delimiter).map(&:to_i)

    negatives = num_list.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    num_list.sum
  end

  private
    def self.parse_custom_delimiter(input)
      delimiter_line, numbers = input.split("\n", 2)
      delimiter = delimiter_line[2..-1]
      [delimiter, numbers]
    end
end