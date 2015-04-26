# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << admin.email
# Environment variables (ENV['...']) can be set in the file .env file.

user = User.create(email: "daniel@hikermeals.com", password: "foofoobar", name: "Daniel")

stories = user.stories.create([{title: "The Dead", description: "The story centres on Gabriel Conroy on the night of the Morkan sisters' annual dance and dinner in the first week of January 1904, perhaps the Feast of the Epiphany (January 6). Typical of the stories in Dubliners, 'The Dead' develops toward a moment of painful self-awareness; Joyce described this as an epiphany. The narrative generally concentrates on Gabriel's insecurities, his social awkwardness, and the defensive way he copes with his discomfort. The story culminates at the point when Gabriel discovers that, through years of marriage, there was much he never knew of his wife's past."}, 
  {title: "Ulysses", description: "Ulysses chronicles the peripatetic appointments and encounters of Leopold Bloom in Dublin in the course of an ordinary day, 16 June 1904. Ulysses is the Latinised name of Odysseus, the hero of Homer's epic poem Odyssey, and the novel establishes a series of parallels between its characters and events and those of the poem (e.g., the correspondence of Leopold Bloom to Odysseus, Molly Bloom to Penelope, and Stephen Dedalus to Telemachus)."}, {title: "Finnegan's Wake", description: "Finnegans Wake is a novel by Irish writer James Joyce. It is significant for its experimental style and reputation as one of the most difficult works of fiction in the English language. Written in Paris over a period of seventeen years, and published in 1939, two years before the author's death, Finnegans Wake was Joyce's final work. The entire book is written in a largely idiosyncratic language, consisting of a mixture of standard English lexical items and neologistic multilingual puns and portmanteau words, which many critics believe were attempts to recreate the experience of sleep and dreams. Owing to the work's expansive linguistic experiments, stream of consciousness writing style, literary allusions, free dream associations, and abandonment of narrative conventions, Finnegans Wake remains largely unread by the general public."}])