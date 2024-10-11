using ArendSportInventiry.Classes;
using ArendSportInventiry.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ArendSportInventiry.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        public string FlagAddOrEdit = "default";
        public Data.User _currentUser = new Data.User();
        public AddEditPage(Data.User user)
        {
            InitializeComponent();

            if (user != null)
            {
                _currentUser = user;
                FlagAddOrEdit = "edit";
            }
            else
            {
                FlagAddOrEdit = "add";
                IdTextBox.Text = Data.SportsEntities.GetContext().User.Max(g => g.Id + 1).ToString();
                _currentUser.Id = Data.SportsEntities.GetContext().User.Max(g => g.Id) + 1;
            }

            DataContext = _currentUser;
            Init();
        }
        private void Init()
        {
            RoleCombo.ItemsSource = Data.SportsEntities.GetContext().Role.ToList();
            GenderComboBox.ItemsSource = Data.SportsEntities.GetContext().FemaleMale.ToList();

            if (FlagAddOrEdit == "edit")
            {
                Surname.Text = _currentUser.Surname;
                Name.Text = _currentUser.Name;
                Patronymic.Text = _currentUser.Patronomyc;
                RoleCombo.SelectedItem = _currentUser.Role1;
                BirthDate.SelectedDate = _currentUser.DateBirth;
                Phone.Text = _currentUser.PhoneNumber;
                GenderComboBox.SelectedItem = _currentUser.FemaleMale;
                Email.Text = _currentUser.Email;
                Login.Text = _currentUser.Login;
                Password.Password = _currentUser.Password;
                IdTextBox.Text = Data.SportsEntities.GetContext().User.Max(g => g.Id + 1).ToString();
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if(FlagAddOrEdit == "edit")
            {
                StringBuilder errors = new StringBuilder();

                if (string.IsNullOrEmpty(Surname.Text))
                {
                    errors.AppendLine("Введите фамилию");
                }
                if (string.IsNullOrEmpty(Name.Text))
                {
                    errors.AppendLine("Введите имя");
                }
                if (string.IsNullOrEmpty(Patronymic.Text))
                {
                    errors.AppendLine("Введите отчество");
                }
                if (RoleCombo.SelectedItem == null)
                {
                    errors.AppendLine("Выберите должность");
                }
                if (string.IsNullOrEmpty(BirthDate.Text))
                {
                    errors.AppendLine("Введите дату рождения");
                }
                if (string.IsNullOrEmpty(Phone.Text))
                {
                    errors.AppendLine("Введите номер телефона");
                }
                if (string.IsNullOrEmpty(Email.Text))
                {
                    errors.AppendLine("Введите Email");
                }
                if (string.IsNullOrEmpty(Login.Text))
                {
                    errors.AppendLine("Введите логин");
                }
                if (string.IsNullOrEmpty(Password.Password))
                {
                    errors.AppendLine("Введите пароль");
                }
                if (Password.Password != ConfirmPassword.Password)
                {
                    errors.AppendLine("Пароли не совпадают");
                }
                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }

            if (FlagAddOrEdit == "add")
            {
                StringBuilder errors = new StringBuilder();

                if (string.IsNullOrEmpty(Surname.Text))
                {
                    errors.AppendLine("Введите фамилию");
                }
                if (string.IsNullOrEmpty(Name.Text))
                {
                    errors.AppendLine("Введите имя");
                }
                if (string.IsNullOrEmpty(Patronymic.Text))
                {
                    errors.AppendLine("Введите отчество");
                }
                if (RoleCombo.SelectedItem == null)
                {
                    errors.AppendLine("Выберите должность");
                }
                if (string.IsNullOrEmpty(BirthDate.Text))
                {
                    errors.AppendLine("Введите дату рождения");
                }
                if (string.IsNullOrEmpty(Phone.Text))
                {
                    errors.AppendLine("Введите номер телефона");
                }
                if (string.IsNullOrEmpty(Email.Text))
                {
                    errors.AppendLine("Введите Email");
                }
                if (Data.SportsEntities.GetContext().User.Any(g => g.Email == Email.Text))
                {
                    errors.AppendLine("Email должен быть уникальным");
                }
                if(string.IsNullOrEmpty(Login.Text))
                {
                    errors.AppendLine("Введите логин");
                }
                if (Data.SportsEntities.GetContext().User.Any(g => g.Login == Login.Text))
                {
                    errors.AppendLine("Логин должен быть уникальным");
                }
                if (string.IsNullOrEmpty(Password.Password))
                {
                    errors.AppendLine("Введите пароль");
                }
                if (Password.Password != ConfirmPassword.Password)
                {
                    errors.AppendLine("Пароли не совпадают");
                }
                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }
                _currentUser.Surname = Surname.Text;
                _currentUser.Name = Name.Text;
                _currentUser.Patronomyc = Patronymic.Text;
                _currentUser.Role = (RoleCombo.SelectedItem as Role).Id;
                _currentUser.DateBirth = BirthDate.SelectedDate.Value;
                _currentUser.PhoneNumber = Phone.Text;
                _currentUser.FemaleMale = GenderComboBox.SelectedItem as FemaleMale;
                _currentUser.Email = Email.Text;
                _currentUser.Login = Login.Text;
                _currentUser.Password = Password.Password;
            
            if (FlagAddOrEdit == "add")
            {
                Data.SportsEntities.GetContext().User.Add(_currentUser);
            }

            Data.SportsEntities.GetContext().SaveChanges();
            MessageBox.Show("Успех", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            Manager.MainFrame.Navigate(new StartPageList());
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new StartPageList());
        }
    }
}
