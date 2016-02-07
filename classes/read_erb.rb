class ReadErb

  attr_reader :groceries

  def initialize
    @groceries = []
    @groceries_from_csv = []

    @groceries_from_csv = CSV.foreach('grocery_list.csv', headers: true, header_converters: :symbol) do |row|
      @groceries << row.to_hash
    end
  end

end
