namespace JD.API
{    
    public class UserAuth
    {
        public string Provider { get; set; }

        public string ProviderUserId { get; set; }

        public virtual User User { get; set; }
    }
}