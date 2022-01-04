Region.create([{ name: 'World' },
               { name: 'Europe' },
               { name: 'Asia' },
               { name: 'Africa' },
               { name: 'Australia' },
               { name: 'South America' },
               { name: 'North America' }])

Sphere.create([{ name: 'education' },
               { name: 'media' },
               { name: 'medicine' },
               { name: 'health care' },
               { name: 'trade' },
               { name: 'ecology' },
               { name: 'industry' },
               { name: 'energetics' },
               { name: 'entertainment' }])

RequirementsPhrase.create(
  [{purpose: 0, name: "funding"},
   {purpose: 0, name: "mentoring"},
   {purpose: 0, name: "marketing"},
   {purpose: 0, name: "strategy"}])

reqPhrase = RequirementsPhrase.find_by(name: 'funding').id

user = User.create(email: "b@gmail.com", nick: "b", about_me: "b", role: 1, password: 111111)

User.create(email: "s@gmail.com", nick: "s", about_me: "s", role: 0, password: 111111 )

project = Project.create(title: "ttt", description: "ddd", user_id: user.id)

sponsor_proposal = SponsorProposal.create({user_id: user.id, project_id: project.id})

SponsorCondition.create(sponsor_proposal_id: sponsor_proposal,
                        requirements_phrase_id: reqPhrase,
                        value: "1000")
