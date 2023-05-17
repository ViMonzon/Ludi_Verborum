import unittest
from unittest.mock import patch, Mock
from user_dao import UserDAO

class TestUserDAO(unittest.TestCase):

    @patch('your_module.fb_auth.login')
    def test_authenticate_user_valid_credentials(self, mock_login):
        mock_login.return_value = None
        dao = UserDAO()
        result = dao.authenticate_user('email_test@example.com', 'password')
        self.assertTrue(result)

    @patch('your_module.fb_auth.login')
    def test_authenticate_user_invalid_credentials(self, mock_login):
        mock_login.side_effect = Exception('Invalid email or password')
        dao = UserDAO()
        result = dao.authenticate_user('email_test@example.com', 'password')
        self.assertFalse(result)
    
    def test_get_words(self):
        user_dao = UserDAO()
        words = user_dao.get_words("email_test@example.com")
        expected_words = ['caca', 'corona']
        self.assertListEqual(words, expected_words)
    

if __name__ == '__main__':
    unittest.main()