//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ArendSportInventiry.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public int Id { get; set; }
        public int Role { get; set; }
        public string Surname { get; set; }
        public string Name { get; set; }
        public string Patronomyc { get; set; }
        public string Email { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        public int SerialPassport { get; set; }
        public int NumberPassport { get; set; }
        public System.DateTime DateBirth { get; set; }
        public System.DateTime LastSeenDate { get; set; }
        public System.TimeSpan LastSeenTime { get; set; }
        public int TypeLogin { get; set; }
        public int MaleFemale { get; set; }
    
        public virtual FemaleMale FemaleMale { get; set; }
        public virtual LoginStatus LoginStatus { get; set; }
        public virtual Role Role1 { get; set; }
    }
}
