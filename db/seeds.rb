# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

books = [
  {
    title: "To Kill a Mockingbird",
    isbn: "9780061120084",
    excerpt: "Scout Finch grows up in the racially charged atmosphere of 1930s Alabama, learning important life lessons from her father, Atticus Finch, as he defends a black man accused of a crime.",
    description: "Harper Lee's 'To Kill a Mockingbird' is a deeply moving tale of racial injustice and moral growth in the 1930s American South. The novel follows young Scout Finch and her brother, Jem, as they witness their father, Atticus, defend a black man falsely accused of raping a white woman. Through their experiences, the children confront the harsh realities of racism, prejudice, and the loss of innocence. The book is a poignant exploration of morality, empathy, and human decency, and it remains one of the most impactful works of American literature.",
    pages_count: 336,
    author_name: "Harper Lee"
  },
  {
    title: "1984",
    isbn: "9780451524935",
    excerpt: "Winston Smith lives under the oppressive regime of Big Brother in a dystopian future where truth is manipulated and individualism suppressed. He dares to seek truth in a society of constant surveillance.",
    description: "George Orwell's '1984' is a dystopian novel set in a future world where totalitarian regimes control every aspect of life. The story follows Winston Smith, a man living in a society where the government, led by Big Brother, monitors and controls every action and thought. Winston becomes disillusioned with the regime and begins to question its motives. The novel explores themes of freedom, censorship, and individuality in the face of oppressive political systems. '1984' is a chilling warning of the dangers of unchecked power and the loss of personal liberties in the pursuit of political control.",
    pages_count: 328,
    author_name: "George Orwell"
  },
  {
    title: "Pride and Prejudice",
    isbn: "9780141439518",
    excerpt: "Elizabeth Bennet navigates the expectations of 19th-century English society, facing love, misunderstandings, and societal pressures as she develops a complex relationship with the aloof Mr. Darcy.",
    description: "'Pride and Prejudice' is Jane Austen's timeless romantic novel about Elizabeth Bennet, a witty and independent young woman, and her complex relationship with the proud and enigmatic Mr. Darcy. Set in early 19th-century England, the novel explores the themes of love, marriage, and social class. As Elizabeth and Darcy overcome misunderstandings and personal flaws, they learn valuable lessons about pride, prejudice, and human nature. Austen's keen observations of societal norms, coupled with her sharp humor, have made 'Pride and Prejudice' a beloved and enduring classic.",
    pages_count: 279,
    author_name: "Jane Austen"
  },
  {
    title: "Moby-Dick",
    isbn: "9780142437247",
    excerpt: "Captain Ahab embarks on a relentless quest to hunt the great white whale, Moby-Dick, as narrated by Ishmael, exploring themes of obsession, fate, and the human condition.",
    description: "'Moby-Dick' is Herman Melville's epic tale of Captain Ahab's obsessive quest to kill the giant white whale, Moby-Dick. The story is narrated by Ishmael, a sailor aboard Ahab's ship, the Pequod. The novel delves into themes of obsession, revenge, and the destructive nature of man’s pursuit of the unattainable. Alongside thrilling descriptions of life at sea, Melville provides deep philosophical reflections on fate, free will, and humanity’s place in the natural world. Despite initial criticism, 'Moby-Dick' has since become a cornerstone of American literature.",
    pages_count: 720,
    author_name: "Herman Melville"
  },
  {
    title: "The Great Gatsby",
    isbn: "9780743273565",
    excerpt: "Nick Carraway recounts the tragic story of Jay Gatsby, a wealthy man obsessed with recapturing the past and winning back his lost love, Daisy Buchanan, in 1920s America.",
    description: "F. Scott Fitzgerald's 'The Great Gatsby' is a portrait of the Roaring Twenties and the elusive American Dream. The novel centers on Jay Gatsby, a mysterious millionaire who throws lavish parties in the hopes of rekindling a romance with his lost love, Daisy Buchanan. Narrated by Nick Carraway, the story explores themes of ambition, love, and the disillusionment that often accompanies the pursuit of wealth. Fitzgerald's lyrical prose and vivid depiction of the Jazz Age make 'The Great Gatsby' one of the most celebrated works of American literature.",
    pages_count: 180,
    author_name: "F. Scott Fitzgerald"
  },
  {
    title: "The Catcher in the Rye",
    isbn: "9780316769488",
    excerpt: "Holden Caulfield, a disillusioned teenager, recounts his experiences in New York City after being expelled from his prep school, struggling with feelings of alienation and the phoniness of the adult world.",
    description: "'The Catcher in the Rye' by J.D. Salinger is a seminal novel that explores teenage angst and alienation through the eyes of its narrator, Holden Caulfield. Holden, recently expelled from a prestigious prep school, wanders New York City, reflecting on the people he meets and his deep-seated frustrations with society. The novel touches on themes of identity, innocence, and rebellion, making it a powerful commentary on the struggles of adolescence. Salinger's direct and candid prose continues to resonate with readers, marking this book as a cornerstone of American literature.",
    pages_count: 214,
    author_name: "J.D. Salinger"
  },
  {
    title: "The Hobbit",
    isbn: "9780547928227",
    excerpt: "Bilbo Baggins, a reluctant hobbit, embarks on an adventure with a group of dwarves to reclaim their homeland from the dragon Smaug, discovering courage, friendship, and wisdom along the way.",
    description: "J.R.R. Tolkien's 'The Hobbit' is a classic fantasy novel that follows the journey of Bilbo Baggins, a hobbit who is thrust into an unexpected adventure. Alongside a group of dwarves and the wizard Gandalf, Bilbo sets out to reclaim the dwarves' lost kingdom from the fearsome dragon Smaug. Along the way, Bilbo encounters trolls, elves, goblins, and the mysterious creature Gollum. Tolkien's richly imagined world and his themes of bravery, friendship, and self-discovery have captivated readers for decades, laying the groundwork for his later epic, 'The Lord of the Rings.'",
    pages_count: 310,
    author_name: "J.R.R. Tolkien"
  },
  {
    title: "The Catch-22",
    isbn: "9781451626650",
    excerpt: "Yossarian, a WWII bombardier, struggles to maintain his sanity while dealing with the absurdity of war, the contradictions of military logic, and his desperate desire to stay alive.",
    description: "Joseph Heller's 'Catch-22' is a satirical and absurdist portrayal of war, focusing on the experiences of Yossarian, a bombardier stationed in Italy during World War II. Yossarian becomes trapped in the paradoxical 'Catch-22,' where soldiers must continue flying dangerous missions unless they are declared insane, but requesting not to fly proves they are sane enough to fly. The novel explores themes of bureaucracy, the absurdity of war, and the struggles of individual morality in the face of institutional madness. 'Catch-22' has become a powerful critique of military life and an enduring classic of 20th-century literature.",
    pages_count: 453,
    author_name: "Joseph Heller"
  },
  {
    title: "Brave New World",
    isbn: "9780060850524",
    excerpt: "In a futuristic society controlled by genetic engineering and state-imposed happiness, individuality and personal freedom are sacrificed, as the protagonist Bernard Marx grapples with a world devoid of true humanity.",
    description: "Aldous Huxley's 'Brave New World' presents a dystopian vision of a future where technology and conditioning have eradicated individuality, freedom, and emotional depth. In this highly controlled society, citizens are genetically engineered into a rigid caste system and kept placated by a drug called 'soma.' The novel follows Bernard Marx, a disillusioned Alpha, as he begins to question the values of this utopian society. Huxley's exploration of consumerism, the loss of personal identity, and the dehumanizing effects of technological progress is a chilling and prescient warning about the future of human civilization.",
    pages_count: 268,
    author_name: "Aldous Huxley"
  },
  {
    title: "The Lord of the Rings: The Fellowship of the Ring",
    isbn: "9780547928210",
    excerpt: "Frodo Baggins embarks on a perilous journey to destroy the One Ring, a powerful artifact that could bring destruction to Middle-earth, with the help of a fellowship of allies.",
    description: "J.R.R. Tolkien's 'The Fellowship of the Ring' is the first volume of 'The Lord of the Rings' trilogy, a monumental epic of good versus evil in the fantastical world of Middle-earth. The story follows Frodo Baggins, a humble hobbit, as he is entrusted with the One Ring, an artifact of immense power forged by the dark lord Sauron. Frodo and his companions—Aragorn, Legolas, Gimli, Gandalf, and others—must journey across treacherous lands to destroy the Ring in the fires of Mount Doom. With rich world-building, mythological depth, and unforgettable characters, Tolkien's work remains a cornerstone of modern fantasy.",
    pages_count: 423,
    author_name: "J.R.R. Tolkien"
  },
  {
    title: "The Road",
    isbn: "9780307387899",
    excerpt: "In a post-apocalyptic world, a father and son journey through desolation, grappling with survival, love, and the persistent struggle to maintain hope in the face of despair.",
    description: "'The Road' by Cormac McCarthy is a haunting tale of a father and son navigating a bleak, post-apocalyptic landscape. With little more than each other and a cart of meager supplies, they travel through desolate terrain, battling starvation, cold, and the ever-present threat of other survivors. The novel explores profound themes of survival, morality, and the human capacity for love in the darkest of times. McCarthy's sparse, poetic language amplifies the novel's emotional intensity, making 'The Road' a powerful meditation on humanity's endurance in the face of utter devastation.",
    pages_count: 287,
    author_name: "Cormac McCarthy"
  },
  {
    title: "The Alchemist",
    isbn: "9780062315007",
    excerpt: "Santiago, a young shepherd, embarks on a journey to fulfill his personal legend, discovering profound wisdom, spiritual insights, and the true meaning of life along the way.",
    description: "Paulo Coelho's 'The Alchemist' is an inspirational novel about a young shepherd named Santiago who leaves his life in Spain to seek treasure in the Egyptian desert. Along the way, Santiago encounters a variety of characters who teach him valuable life lessons, from a crystal merchant to an alchemist. The novel is a spiritual allegory about pursuing one's dreams, embracing the journey of life, and discovering that the treasure we seek is often closer than we realize. 'The Alchemist' has become an international bestseller for its timeless message of hope and perseverance.",
    pages_count: 208,
    author_name: "Paulo Coelho"
  },
  {
    title: "Beloved",
    isbn: "9781400033416",
    excerpt: "Sethe, an escaped slave, is haunted by the ghost of her daughter, Beloved, as she confronts the trauma of her past and struggles to rebuild her life after slavery.",
    description: "Toni Morrison's 'Beloved' is a powerful exploration of the lasting trauma of slavery in post-Civil War America. The novel follows Sethe, an escaped slave living in Ohio, who is haunted by the spirit of her dead daughter, Beloved. As Sethe tries to reconcile with her past and rebuild her life, the novel delves deep into the psychological scars left by slavery, motherhood, and loss. Morrison's poetic prose and unflinching portrayal of pain and survival earned 'Beloved' critical acclaim and a Pulitzer Prize, solidifying her place as one of the most important voices in American literature.",
    pages_count: 324,
    author_name: "Toni Morrison"
  },
  {
    title: "Crime and Punishment",
    isbn: "9780486415864",
    excerpt: "Raskolnikov, a former student, grapples with guilt after committing a murder, leading to a psychological struggle with morality, redemption, and the consequences of his actions in St. Petersburg.",
    description: "'Crime and Punishment' by Fyodor Dostoevsky follows the story of Rodion Raskolnikov, a former student who believes he is above moral laws and commits a heinous crime to test his theories. As he navigates the complexities of guilt, morality, and redemption, Raskolnikov experiences profound psychological torment and existential crises. Dostoevsky explores themes of suffering, the nature of evil, and the possibility of redemption through Raskolnikov's interactions with various characters who embody different facets of society. The novel's intense psychological depth and philosophical inquiries make it a seminal work in world literature.",
    pages_count: 430,
    author_name: "Fyodor Dostoevsky"
  },
  {
    title: "The Old Man and the Sea",
    isbn: "9780684801223",
    excerpt: "An aging fisherman struggles against the forces of nature, battling a giant marlin in a testament to human endurance, resilience, and the eternal quest for achievement and dignity.",
    description: "'The Old Man and the Sea' by Ernest Hemingway tells the story of Santiago, an old fisherman who has gone 84 days without catching a fish. Undeterred, he sets out alone into the Gulf Stream, determined to catch a giant marlin. The narrative beautifully captures the struggle between man and nature, exploring themes of perseverance, dignity, and the human spirit's resilience. Santiago's epic battle with the marlin symbolizes the universal quest for achievement and the inner strength that emerges in the face of adversity. Hemingway's masterful prose and deep insights into human nature make this novella a classic in American literature.",
    pages_count: 128,
    author_name: "Ernest Hemingway"
  },
  {
    title: "The Brothers Karamazov",
    isbn: "9780374528379",
    excerpt: "The Karamazov brothers confront questions of faith, morality, and free will, exploring deep philosophical themes through their relationships, particularly in the context of a patricidal crisis within their family.",
    description: "'The Brothers Karamazov' by Fyodor Dostoevsky is a profound exploration of faith, doubt, morality, and the human condition through the lens of the Karamazov family. The novel centers on the three brothers—Dmitri, Ivan, and Alyosha—who embody different philosophical perspectives and grapple with profound moral dilemmas, including the question of God’s existence and the nature of evil. Their conflicting beliefs culminate in a dramatic patricidal crisis that forces them to confront their identities and values. Dostoevsky’s intricate narrative weaves together theological, ethical, and existential themes, making it one of the most significant works in literature.",
    pages_count: 796,
    author_name: "Fyodor Dostoevsky"
  }
]

# books.each do |book|
#   Book.create!(book)
# end

user = User.first
50.times do |i|
  article = Article.create!(
    user: user,
    title: FFaker::Book.title,
    excerpt: FFaker::Lorem.sentence,
    content: FFaker::Lorem.paragraphs(rand(3..5)).join("\n\n")
  )
  puts "Created article #{i+1}: #{article.title}"
end


puts "Created #{Article.count} articles"
