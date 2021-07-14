require './lib/joke'
require './lib/user'

RSpec.describe do
  context 'iteration 2' do
    it 'exists' do
      user_1 = User.new('Sal')

      expect(user_1).to be_a(User)
    end

    it 'has a name' do
      user_1 = User.new('Sal')

      expect(user_1.name).to eq('Sal')
    end

    it 'has no jokes by default' do
      user_1 = User.new('Sal')

      expect(user_1.jokes).to eq([])
    end

    it 'can learn jokes' do
      user_1 = User.new('Sal')
      joke_1 = Joke.new(22, 'Why did the strawberry cross the road?', 'Because his mother was in a jam.')
      joke_2 = Joke.new(13, 'How do you keep a lion from charging?', 'Take away its credit cards.')

      user_1.learn(joke_1)
      user_1.learn(joke_2)

      expect(user_1.jokes.length).to be(2)
      expect(user_1.jokes.first).to be_a(Joke)
      expect(user_1.jokes.first).to eq(joke_1)
      expect(user_1.jokes.last).to eq(joke_2)
      expect(user_1.jokes.first.id).to eq(22)
      expect(user_1.jokes.first.setup).to eq('Why did the strawberry cross the road?')
      expect(user_1.jokes.first.punchline).to eq('Because his mother was in a jam.')
    end
  end

  context 'iteration 3' do
    it 'can tell jokes to other users' do
      user_1 = User.new('Sal')
      user_2 = User.new('Ali')
      joke_1 = Joke.new(22, 'Why did the strawberry cross the road?', 'Because his mother was in a jam.')
      joke_2 = Joke.new(13, 'How do you keep a lion from charging?', 'Take away its credit cards.')

      user_1.learn(joke_1)
      user_1.learn(joke_2)
      user_1.tell(user_2, joke_1)
      user_1.tell(user_2, joke_2)

      expect(user_2.jokes.length).to be(2)
      expect(user_2.jokes.first).to be_a(Joke)
      expect(user_2.jokes.first).to eq(joke_1)
      expect(user_2.jokes.last).to eq(joke_2)
      expect(user_2.jokes.first.id).to eq(22)
      expect(user_2.jokes.first.setup).to eq('Why did the strawberry cross the road?')
      expect(user_2.jokes.first.punchline).to eq('Because his mother was in a jam.')
    end

    it "can show a joke if given the ID" do
      user_1 = User.new('Sal')
      user_2 = User.new('Ali')
      joke_1 = Joke.new(22, 'Why did the strawberry cross the road?', 'Because his mother was in a jam.')
      joke_2 = Joke.new(13, 'How do you keep a lion from charging?', 'Take away its credit cards.')

      user_1.learn(joke_1)
      user_1.learn(joke_2)
      user_1.tell(user_2, joke_1)
      user_1.tell(user_2, joke_2)

      expect(user_2.joke_by_id(22)).to be_a(Joke)
      expect(user_2.joke_by_id(22).setup).to eq('Why did the strawberry cross the road?')
      expect(user_2.joke_by_id(22).punchline).to eq('Because his mother was in a jam.')
      expect(user_2.joke_by_id(13)).to be_a(Joke)
      expect(user_2.joke_by_id(13).setup).to eq('How do you keep a lion from charging?')
      expect(user_2.joke_by_id(13).punchline).to eq('Take away its credit cards.')
    end
  end
end
