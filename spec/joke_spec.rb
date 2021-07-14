require './lib/joke'

RSpec.describe do
  it 'exists' do
    joke = Joke.new(22, 'Why did the strawberry cross the road?', 'Because his mother was in a jam.')

    expect(joke).to be_a(Joke)
  end

  it 'has an ID' do
    joke = Joke.new(22, 'Why did the strawberry cross the road?', 'Because his mother was in a jam.')

    expect(joke.id).to eq(22)
  end

  it 'has a setup' do
    joke = Joke.new(22, 'Why did the strawberry cross the road?', 'Because his mother was in a jam.')

    expect(joke.setup).to eq('Why did the strawberry cross the road?')
  end

  it 'has a punchline' do
    joke = Joke.new(22, 'Why did the strawberry cross the road?', 'Because his mother was in a jam.')

    expect(joke.punchline).to eq('Because his mother was in a jam.')
  end
end
