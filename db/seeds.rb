Region.create([{ name: 'Europe' },
               { name: 'Asia' },
               { name: 'Africa' },
               { name: 'Australia' },
               { name: 'South America' },
               { name: 'North America' }])

Sphere.create([{ name: 'Education' },
               { name: 'Media' },
               { name: 'Medicine' },
               { name: 'Health care' },
               { name: 'Trade' },
               { name: 'Ecology' },
               { name: 'Industry' },
               { name: 'Energetics' },
               { name: 'Entertainment' }])

RequirementsPhrase.create(
  [{purpose: 0, name: "Funding"},
   {purpose: 0, name: "Mentoring"},
   {purpose: 0, name: "Marketing"},
   {purpose: 0, name: "Strategy"}])

reqPhrase = RequirementsPhrase.find_by(name: 'funding').id

user = User.create(email: "b@gmail.com", nick: "Boris", about_me: "I'am Boris", role: 1, password: 111111)

User.create(email: "s@gmail.com", nick: "Serj", about_me: "I'am Serj", role: 0, password: 111111 )

project = Project.create(title: "Garbage recycling", description: "Modern highly efficient waste processing using bacteria", user_id: user.id)

sponsor_proposal = SponsorProposal.create({user_id: user.id, project_id: project.id})

SponsorCondition.create(sponsor_proposal_id: sponsor_proposal,
                        requirements_phrase_id: reqPhrase,
                        value: "1000")
