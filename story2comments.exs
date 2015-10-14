defmodule Story do
  # docstring are quite useful you can generate docs out of them
  # check: http://elixir-lang.org/getting-started/module-attributes.html
  # for more info
  @doc """
  Gets name from standard IO
  """
  def get_name do
    String.strip IO.gets("What is your name? ")
  end

  # def get_cow_lover do
  #   IO.getn("Do you like cows? [y|n]", 1)
  # end
  # for person = %{ height: height } <- people, height > 1.5,
  # do: IO.inspect person
  #
  #
  # def interrogate do
  #   case String.downcase(get_cow_lover) do
  #     "y" ->
  #       IO.puts "Yes you like cows"
  #     "n" ->
  #       IO.puts "No you dont"
  #     _ ->
  #       IO.puts "You should have entered 'Y' or 'N'."
  #   end
  # end

  def load_story do
    # File.stream!("./stories/story1.txt")
    #   #|> Stream.chunk(1)
    #   |> Enum.each(fn chunk ->
    #   # do something with chunk
    #     chunk
    # end)
    case File.read("./stories/story1.eex") do
      {:ok, result} -> result
      {:error, reason} -> IO.puts "Error reading file"
    end
  end

  def create do
    :random.seed(:os.timestamp)

    # subject_pronoun = ~c{I, we, you, he, she, it, or they}
    # subjects = ~c{peasant,cat,hedgehog,mad prince}
    # nouns = ~c{poverty,farm,vegetable garden,ox,farm,wood}
    # adjectives = ~c{small,single,ramshackle,old}
    # verbs = ["mildewed"]
    # IO.puts "Once upon a time, there was a #{Enum.random(subjects)} who, in spite of his #{Enum.random(nouns)}, had a #{Enum.random(adjectives)} #{Enum.random(nouns)}, a #{Enum.random(nouns)} and a #{Enum.random(adjectives)} #{Enum.random(nouns)}."
    # IO.puts "His very #{Enum.random(adjectives)} #{Enum.random(nouns)} was made of #{Enum.random(adjectives)} #{Enum.random(nouns)} which #{Enum.random(verbs)}."
    # IO.puts "A lady gets on a public bus. Without saying a word, she gestures to the bus driver by sticking her thumb on her nose and waving her fingers at the driver."

    # interrogate


    list = [
      name_1: get_name,
      name_2: random(:name),
      character_1: random(:character),
      character_2: random(:character),
      random: (fn(n) -> random(n) end)
    ]

    EEx.eval_file "./stories/story2.eex", list #=> "foo baz"

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
