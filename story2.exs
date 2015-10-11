defmodule Story do
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

    names = ~w{Keith Tanya Oksana Antonia Barbara Bob Richard Mickel}
    characters = ~w{cat dog girl boy princess prince hedgehog frog fly mouse worm}
    adjectives = ~w{dishonest dogmatic domineering finicky flirtatious foolish foolhardy fussy greedy grumpy gullible harsh impatient impolite impulsive inconsiderate inconsistent indecisive indiscreet inflexible interfering intolerant irresponsible beautiful ugly great fat smelly}
    relatives = ~w{father mother sister uncle}
    verbs = ~w{eat watch touch smell rub lick}
    numbers = ~w{23 45 34 62}
    nouns = ~w{cup shoe hair cock balls vagina}

    character_1 = Enum.random(characters)
    name_1 = Enum.random(names)
    name_2 = Enum.random(names)
    character_2 = Enum.random(characters)

    IO.write """
    Once upon a time there was a #{character_1} called #{name_1}. The #{name_1} was a #{Enum.random(adjectives)}, #{Enum.random(adjectives)}, #{Enum.random(adjectives)}, #{Enum.random(adjectives)} #{character_1}. #{name_1} liked to #{Enum.random(verbs)} #{Enum.random(nouns)} and #{Enum.random(verbs)} #{Enum.random(nouns)}.

    When the #{character_1} was #{Enum.random(numbers)} years she fell in love with a #{Enum.random(adjectives)}, #{Enum.random(adjectives)}, #{Enum.random(adjectives)} #{character_2}, called #{name_2} who was #{Enum.random(numbers)} years old.

    #{name_2} also fell in love with #{name_1} for her #{Enum.random(adjectives)} #{Enum.random(nouns)}. They really wanted to #{Enum.random(verbs)} together all their lives.

    But all falling in love business was against #{character_1}’s #{Enum.random(adjectives)} father will. #{character_2}, who was totally in love with #{character_1} conviced #{character_1} father to let him marry #{character_1} if #{character_2} will #{Enum.random(verbs)} #{Enum.random(nouns)} #{Enum.random(numbers)} times in a row then #{Enum.random(verbs)} #{Enum.random(nouns)} and #{Enum.random(verbs)} #{Enum.random(nouns)}. #{character_2} did that immediately and they lived happy ever after.
    """
# for person = %{ height: height } <- people, height > 1.5,
# do: IO.inspect person
#
  end
end

Story.create
