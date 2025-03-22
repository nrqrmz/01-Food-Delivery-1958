require_relative '../repositories/base_repository'

class MealRepository < BaseRepository
  private

  def save_csv
    CSV.open(@csv_filepath, 'wb') do |csv|
      csv << %w[id name price]

      @elements.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_filepath, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i

      meal = Meal.new(row)

      @elements << meal
    end

    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end
