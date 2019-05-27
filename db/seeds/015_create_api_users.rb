# Token and Secrets
SECRET ||= '$2a$10$reXHMgegkckEKlceQ.0S5u/L44tbhU46C8TCdSn8HOePlEvnGYTI.'
TOKEN ||= 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiQW5hIFBhdWxhIENoYXZlcyIsImVtYWlsIjoiYW5hcGF1bGEuY2hhdmVzQGdtYWlsLmNvbSJ9.2ZOfSu2AbDH6EdIblImBG5ciVoXogLlXvUaWJAz17qc'
SECRET_2 ||= '$2a$10$F1DO6yDclNdFPvzg7KG51.1Gk9cNWGA3CRvp6.D1PWArKlsev7QMG'
TOKEN_2 ||= 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiR3VzdGF2byBGcmVpcmUgT2xpdmVpcmEiLCJlbWFpbCI6ImZyZWlyZS5vbGl2ZWlyYUBob3RtYWlsLmNvbSJ9.vNfwaSxpdVosGsnaS06JWt9NtMoAkOqwnjWcIAnFCy4'
SECRET_3 ||= '$2a$10$OzJkJBid71H2SRlVxv71buTP2hHoDFe4dIqIV9QjWebYy222W4Uoa'
TOKEN_3 ||= 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiTWF0aGV1cyBGcmFuY2lzY28gZG9zIFNhbnRvcyIsImVtYWlsIjoibWF0aGV1cy1mcmFuY2lzY29AeWFob28uY29tIn0.-z3L4M7C5-7JYNeKv_UrKaRhEVtdtsP5ho3w66Xl6PM'

# API Users
puts "Creating API Users"
api_user = ApiUser.find_or_create_by(name: 'Ana Paula Chaves', email: 'anapaula.chaves@gmail.com', secret: SECRET, token: TOKEN, user_id: 6)
api_user_2 = ApiUser.find_or_create_by(name: 'Gustavo Freire Oliveira', email: 'freire.oliveira@hotmail.com', secret: SECRET_2, token: TOKEN_2, user_id: 6)
api_user_3 = ApiUser.find_or_create_by(name: 'Matheus Francisco dos Santos', email: 'matheus-francisco@yahoo.com', secret: SECRET_3, token: TOKEN_3, user_id: 1)