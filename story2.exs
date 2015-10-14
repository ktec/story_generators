defmodule Story do
  def get_name do
    String.strip IO.gets("What is your name? ")
  end

  def load_story do
    case File.read("./stories/story1.eex") do
      {:ok, result} -> result
      {:error, reason} -> IO.puts "Error reading file"
    end
  end

  def create do
    :random.seed(:os.timestamp)

    list = [
      name_1: get_name,
      name_2: random(:name),
      character_1: random(:character),
      character_2: random(:character),
      random: (fn(n) -> random(n) end)
    ]

    EEx.eval_file "./stories/story1.eex", list #=> "foo baz"

  end

  def random(word_type) do
    names = ~w{Keith Tanya Oksana Antonia Barbara Bob Richard Mickel}
    nouns = ~w{cup shoe hair cock balls vagina}
    adjectives = ~w{dishonest dogmatic domineering finicky flirtatious foolish foolhardy fussy greedy grumpy gullible harsh impatient impolite impulsive inconsiderate inconsistent indecisive indiscreet inflexible interfering intolerant irresponsible beautiful ugly great fat smelly}
    characters = ~w{cat dog girl boy princess prince hedgehog frog fly mouse worm}
    relatives = ~w{father mother sister uncle}
    verbs = ~w{eat watch touch smell rub lick}
    numbers = ~w{23 45 34 62}

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
