class BaseRepository
  def initialize(csv_file_path, klass)
    @klass = klass
    @csv_file_path = csv_file_path
    @elements = []
    load_csv if File.exist?(csv_file_path)
  end

  def all
    @elements
  end

  def create(element)
    # customers array is empty => 1
    # customers array has 10 customers => 11
    element.id = @elements.empty? ? 1 : @elements.last.id + 1
    @elements << element
    save_csv
  end


  private


  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      # WRITE THE HEADERS FIRST
      csv << @klass.prepare_headers
      # can push each customer into the csv
      @elements.each do |element|
        csv << element.to_csv
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row = @klass.prepare_row(row)
      # Instantiate a new customer
      element = @klass.new(row)
      # Add this new customer to the customers array
      @elements << element
    end
  end
end
