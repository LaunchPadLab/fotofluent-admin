Language.create!([
  {name: 'French', language_key: 'FRA', flag: 'france.png', language_code: 'fr-FR'},
  {name: 'German', language_key: 'GER', flag: 'germany.png', language_code: 'de-DE'},
  {name: 'Spanish', language_key: 'SPA', flag: 'spain.png', language_code: 'es-ES'},
  {name: 'Italian', language_key: 'ITA', flag: 'italy.png', language_code: 'it-IT'}
])

p "Created #{Language.all.count} lanugages"

german = Language.find_by(name: 'German')
spanish = Language.find_by(name: 'Spanish')
italian = Language.find_by(name: 'Italianl')
french = Language.find_by(name: 'French')

blue = Word.create!(word: 'Blue', grouping: 'colors')
green = Word.create!(word: 'Green', grouping: 'colors')
one = Word.create!(word: 'One', grouping: 'numbers')
two = Word.create!(word: 'Two', grouping: 'numbers')
three = Word.create!(word: 'Three', grouping: 'numbers')

p "Created #{Word.all.count} words"

Translation.create!(foreign_word: 'Blau', language_id: german.id, word_id: blue.id)
Translation.create!(foreign_word: 'Azul', language_id: spanish.id, word_id: blue.id)

Translation.create!(foreign_word: 'Grün', language_id: german.id, word_id: green.id)
Translation.create!(foreign_word: 'Verde', language_id: spanish.id, word_id: green.id)

Translation.create!(foreign_word: 'Uno', language_id: spanish.id, word_id: one.id)
Translation.create!(foreign_word: 'Dos', language_id: spanish.id, word_id: two.id )
Translation.create!(foreign_word: 'Tres', language_id: spanish.id, word_id: three.id )

Translation.create!(foreign_word: 'Eins', language_id: german.id, word_id: one.id)
Translation.create!(foreign_word: 'Zwei', language_id: german.id, word_id: two.id)
Translation.create!(foreign_word: 'Drei', language_id: german.id, word_id: three.id)

p "Created #{Translation.all.count} translations"
