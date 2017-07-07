Word.destroy_all
Language.destroy_all
Translation.destroy_all

languages = ["German", "Spanish", "Italian", "French"]

languages.each { |lang| Language.create!(name: lang)}
puts "#{Language.all.count} languages created"

words = [
          {
            word: "Arm",
            image: "https://images.unsplash.com/photo-1482100199117-a4a38a64e7e3?dpr=1&auto=compress,format&fit=crop&w=376&h=251&q=80&cs=tinysrgb&crop=&bg=",
            grouping: "Body",
            german: "Gesicht"
          },
          {
            word: "Back",
            image: "https://images.unsplash.com/photo-1458312631043-b3ee472ec089?dpr=1&auto=compress,format&fit=crop&w=376&h=564&q=80&cs=tinysrgb&crop=&bg=",
            grouping: "Body",
            german: "Rücken"
          },
          {
            word: "Ear",
            image: "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?dpr=1&auto=compress,format&fit=crop&w=376&h=251&q=80&cs=tinysrgb&crop=&bg=",
            grouping: "Body",
            german: "Ohr"
          },
          {
            word: "Eye",
            image: "https://images.unsplash.com/photo-1485484979496-9363c53ee97b?dpr=1&auto=compress,format&fit=crop&w=376&h=251&q=80&cs=tinysrgb&crop=&bg=",
            grouping: "Body",
            german: "Auge"
          },
          {
            word: "Face",
            image: "https://images.unsplash.com/photo-1471857497812-f841e2ca8dfc?dpr=1&auto=compress,format&fit=crop&w=376&h=564&q=80&cs=tinysrgb&crop=&bg=",
            grouping: "Body",
            german: "Gesicht"
          },
          {
            word: "Feet",
            image: "https://images.unsplash.com/photo-1484791984053-c4abb3fd681b?dpr=1&auto=compress,format&fit=crop&w=376&h=251&q=80&cs=tinysrgb&crop=&bg=",
            grouping: "Body",
            german: "Füße"
          }
        ]

words.each do |word|
  new_word = Word.create!(
                word: word[:word],
                image: word[:image],
                grouping: word[:grouping]
              )

  new_word.translations.create!(
    foreign_word: word[:german],
    language_id: Language.first.id
  )
end

puts "#{Word.all.count} words created"
puts "#{Translation.all.count} translations created"
