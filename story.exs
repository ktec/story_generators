defmodule Story do
  def pronouns do
    ["cat","dog","bird","worm","banker"]
  end

  def relative_pronouns do
    ["who","which","that"]
  end

  def objects do
    ["on the mat", "in the lap", "up the tree","down the road"]
  end

  def nouns do
    ["mat","lap","tree","lauderette","books"]
  end

  def adjectives do
    ["nice","warm","cold","cosy","bushy","soft"]
  end

  def adjuncts do
    ["yesterday","in the morning","like a demon","as you could have been"]
  end
#
  def verbs do
    ["ate","read", "sat", "stood","jump","is"]
  end

  # used to express when, where, how, for what reason, or to what degree an action
  def adverbs do # mainly used to modify verbs
    #["sat on","stood behind","jumped on","looked at","helped"]
    ["quickly","in the garden","in August","happily","slowly","with great joy"]
  end

  def predicates do # verb and direct or indirect objects
    ["stole my bike","is a monster","with a dog"]
  end

  def subjects do
    ["He","The man from the shop"]
  end

  def take_random_from (list) do
    :random.seed(:os.timestamp)
    Enum.random(list)
  end

  def time_of_day do
    [
      "Just after sunrise",
      "In the morning",
      "After lunch",
      "Before sunset",
      "In the evening",
      "At midnight",
    ]
  end

  # The Hierarchy of Word Units

  # 1. Word (e.g., Shark) - the smallest meaningful unit.
  #
  # 2. Phrase (e.g., A seven-foot tiger shark)
  #   a single piece of information made up of more than one word, not contain a subject and a verb.
  #
  # 3. Clause (e.g., When a seven-foot tiger shark arrived...)
  #   a single piece of information made up of more than one word which contains a subject and a verb.
  #
  # 3. Sentence (e.g., A seven-foot tiger shark arrived.)
  #   conveys a complete idea. must contain at least one clause.
  #   Note: A clause that stands alone as a sentence is known as an independent clause.)
  #
  # 4. Complex Sentence (e.g., When a seven-foot tiger shark arrived, the crew stopped fishing.)
  #   an independent clause supported by at least one other clause.
  #
  # 5. Compound Sentence (e.g., A seven-foot tiger shark arrived, and the crew stopped fishing.)
  #   a sentence made up of at least two independent clauses.

  # The Four Types of Sentence
  #
  # 1. A declarative sentence states a fact and ends with a full stop
  # eg. He has every attribute of a dog except loyalty.
  #
  # 2. An imperative sentence is a command or a polite request and ends with an
  #  exclamation mark or a period / full stop.
  #  eg. When a dog runs at you, whistle for him.
  #
  # 3. An interrogative sentence asks a question and ends with a question mark.
  #  Who knew that dog saliva can mend a broken heart?
  #
  # 4. An exclamatory sentence expresses excitement or emotion
  #  In Washington, it's dog eat dog. In academia, it's exactly the opposite!

  # The Four Sentence Structure
  #
  # A sentence can consist of a single clause or several clauses.
  # When a sentence is a single clause, it is called a simple sentence
  # (and the clause is called an independent clause)
  #
  # 1. A Complex Sentence.
  #   A complex sentence has an independent clause and at least one dependent clause.
  #     When you're on the Internet, nobody knows you're a dog.
  #
  # 2. A Compound Sentence.
  #   A compound sentence has at least two independent clauses.
  #     Cry "Havoc," and let slip the dogs of war.
  #
  # 3. A Simple Sentence.
  #   A simple sentence has just one independent clause.
  #     You can't surprise a man with a dog.
  #
  # 4. A Compound-Complex Sentence.
  #   A compound-complex sentence has at least two independent clauses and at
  #   least one dependent clause.
  #     When a dog bites a man, that is not news because it happens so often,
  #     but if a man bites a dog, that is news.

  def sentences(args) do
    case args do
      {t,p,n,v,a,o} -> "the #{p} #{v} #{o}."
      {t,_,n,v,a,_} -> ""
      {_,_,_,v,_}   -> "#{v}"
      _             -> "nothing"
    end
    # [
    #   "the #{p} #{v} #{o}.",
    #   # "#{t} the #{n} was #{a}.",
    #   # "#{t} the #{p} #{v} the #{n}.",
    #   # "#{t} the #{n} #{v} #{a} #{n}."
    # ]
  end

  def create_sentence do
    t = take_random_from time_of_day
    p = take_random_from pronouns
    n = take_random_from nouns
    v = take_random_from verbs
    o = take_random_from objects
    a = take_random_from adjectives
    sentences({t,p,n,v,a,o})
  end

  def create_paragraphs(count) do
    Enum.map_join(1..count, " ", fn(_) ->
      create_sentence
    end)
  end

  def create_story do
    create_paragraphs(9)
  end

end

IO.puts Story.create_story
