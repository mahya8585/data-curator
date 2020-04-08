from twilio.rest import Client

account_sid = 'your twilio account sid'
auth_token = 'your twilio auth token'
client = Client(account_sid, auth_token)

xml_file = open('get-bodytemperature.xml', 'r', encoding='utf-8')
call = client.calls.create(
                        twiml=xml_file.read(),
                        to='call number',
                        from_='your twilio phone number'
                    )

print(call.sid)
