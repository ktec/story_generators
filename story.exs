defmodule Story do
  def get_name do
    String.strip IO.gets("What is your name? ")
  end

  def load_file(file) do
    case File.read(file) do
      {:ok, result} -> String.split(result, "\n")
                        # |> Stream.map(&String.split(&1, " "))
                        |> Enum.filter(fn(n) -> n != "" end)
      {:error, reason} -> IO.puts "Error reading file"
    end
  end

  def create do
    :random.seed(:os.timestamp)

    list = [
      name_1: random(:name), #get_name,
      name_2: random(:name),
      character_1: random(:character),
      character_2: random(:character),
      random: (fn(n) -> random(n) end)
    ]

    EEx.eval_file "./stories/story1.eex", list #=> "foo baz"

  end

  def random(word_type) do
    names = load_file("./words/names")
    nouns = load_file("./words/nouns")
    adjectives = load_file("./words/adjectives")
    characters = load_file("./words/characters")
    relatives = load_file("./words/relatives")
    verbs = load_file("./words/verbs")
    numbers = load_file("./words/numbers")

    case word_type do
      :name      -> Enum.random(names)
      :noun      -> Enum.random(nouns)
      :adjective -> Enum.random(adjectives)
      :character -> Enum.random(characters)
      :relative  -> Enum.random(relatives)
      :verb      -> Enum.random(verbs)
      :number    -> Enum.random(numbers)
      _          -> "Unknown word type"
    end
  end
end

IO.write Story.create
