class BaseRepository
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @elements = []
    @next_id = 1

    load_csv if File.exist?(@csv_filepath)
  end

  def all
    @elements
  end

  def create(element)
    element.id = @next_id
    @elements << element
    @next_id += 1

    save_csv
  end

  def find(element_id)
    @elements.find { |element| element.id == element_id }
  end
end
