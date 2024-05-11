using TechTribePro.Models;

namespace TechTribePro.Repositories
{
    public interface IUserRepository
    {
        void Add(UserProfile userProfile);
        UserProfile GetByEmail(string email);
    }
}