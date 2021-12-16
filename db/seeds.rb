# frozen_string_literal: true

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
  [{purpose: 0, requirement: "funding"},
   {purpose: 0, requirement: "mentoring"},
   {purpose: 0, requirement: "marketing"},
   {purpose: 0, requirement: "strategy"}])

reqPhrase = RequirementsPhrase.find_by(requirement: 'funding')

user = User.create(email: "andrewtehanov@gmail.com", phone_number: "123", nick: "aaa", about_me: "", role: 0)

project = Project.create(title: "ttt", description: "ddd", user_id: user.id)

sponsor_proposal = SponsorProposal.create({user_id: user.id, project_id: project.id})

SponsorCondition.create(proposal_id: sponsor_proposal.id, requirement_id: reqPhrase.id, value: "1000")
