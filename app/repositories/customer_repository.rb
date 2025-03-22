require_relative '../repositories/base_repository'

class CustomerRepository < BaseRepository
  private

  def save_csv
    CSV.open(@csv_filepath, 'wb') do |csv|
      csv << %w[id name address]

      @elements.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_filepath, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i

      customer = Customer.new(row)

      @elements << customer
    end

    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end
