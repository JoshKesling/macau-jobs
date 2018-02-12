# # Users
# user1                         = User.new
# user1.email                   = 'josh@example.com'
# user1.username                = 'Josh'
# user1.password                = 'password'
# user1.password_confirmation   = 'password'
# user1.admin                   = true
# user1.save

# user2                         = User.new
# user2.email                   = 'bobby@example.com'
# user2.username                = 'Bobby'
# user2.password                = 'password'
# user2.password_confirmation   = 'password'
# user2.admin                   = false
# user2.save
            
# # Agents
# agent1                        = Agent.new
# agent1.name                   = 'Madam Vixies'
# agent1.email                  = 'vixiespixies@example.com'
# agent1.address                = 'Somewhere other than here'
# agent1.phone                  = '6969-6969'
# agent1.save

# agent2                        = Agent.new
# agent2.name                   = 'Bossy Bossman'
# agent2.email                  = 'BossyBoss@example.com'
# agent2.address                = 'Somewhere out there'
# agent2.phone                  = '8765-4321'
# agent2.save

# # Jobs
# user1.jobs.create(
#   title:      'Sauna Girls',
#   summary:    'We need girls, 18-25, for massage plus plus services.',
#   body:       'Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.
#               Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.
#               Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.',
#   open:       true,
#   agent_id:   Agent.first.id
# )

# user1.jobs.create(
#   title:      'Fish Mongers',
#   summary:    'Looking for males who can sling fish with the best of them.',
#   body:       'Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.
#               Podcasting operational change management inside of workflows to establish a framework. Taking seamless key performance indicators offline to maximise the long tail. Keeping your eye on the ball while performing a deep dive on the start-up mentality to derive convergence on cross-platform integration.',
#   open:       true,
#   agent_id:   Agent.first.id
# )

# user1.jobs.create(
#   title:      'Corporate Execs',
#   summary:    'We are filling positions for CEOs of Fortune 500 companies.',
#   body:       'Podcasting operational change management inside of workflows to establish a framework. Taking seamless key performance indicators offline to maximise the long tail. Keeping your eye on the ball while performing a deep dive on the start-up mentality to derive convergence on cross-platform integration.
#               Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.',
#   open:       true,
#   agent_id:   Agent.second.id
# )

# # CVs
# user2.create_cv(
#   first_name:               'Bobby',
#   middle_name:              'Robert',
#   last_name:                'Singer',
#   age:                      55,
#   height:                   55,
#   weight:                   55,
#   marital_status:           'Married',
#   children:                 3,
#   phone_number:             '6666-6666',
#   current_address:          'In a van down by the river'
#   current_city:             'Macau',
#   current_country:          'Macao',
#   skills:                   'I kill demons',
#   work_visa:                true,
#   visa_exp_date:            DateTime.new(2020, 1, 1),
#   passport_country:         'Indonesia',
#   passport_number:          '12345678',
#   passport_expiration_date: DateTime.new(2020, 1, 1)
# )