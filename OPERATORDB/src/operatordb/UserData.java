
package operatordb;


public class UserData {
    
  String Lastname, Firstname, Middlename, Sex, Civilstatus, Street,Baranggay, City, Province, id, Phonenumber, Birthdate;
  int Age, Housenumber;

    public UserData(String Lastname, String Firstname, String Middlename, String Sex, String Civilstatus,
                    int Housenumber, String Street, String Baranggay, String City, String Province, String id, 
                    int Age, String Birthdate, String Phonenumber) {
        
        this.Lastname = Lastname;
        this.Firstname = Firstname;
        this.Middlename = Middlename;
        this.Sex = Sex;
        this.Civilstatus = Civilstatus;
        this.Housenumber = Housenumber;
        this.Street = Street;
        this.Baranggay = Baranggay;
        this.City = City;
        this.Province = Province;
        this.id = id;
        this.Age = Age;
        this.Birthdate = Birthdate;
        this.Phonenumber = Phonenumber;
    }

    public String getLastname() {
        return Lastname;
    }

    public String getFirstname() {
        return Firstname;
    }

    public String getMiddlename() {
        return Middlename;
    }

    public String getSex() {
        return Sex;
    }

    public String getCivilstatus() {
        return Civilstatus;
    }

    public int getHousenumber() {
        return Housenumber;
    }

    public String getStreet() {
        return Street;
    }

    public String getBaranggay() {
        return Baranggay;
    }

    public String getCity() {
        return City;
    }

    public String getProvince() {
        return Province;
    }

    public String getId() {
        return id;
    }

    public int getAge() {
        return Age;
    }

    public String getBirthdate() {
        return Birthdate;
    }

    public String getPhonenumber() {
        return Phonenumber;
    }

    public void setLastname(String Lastname) {
        this.Lastname = Lastname;
    }

    public void setFirstname(String Firstname) {
        this.Firstname = Firstname;
    }

    public void setMiddlename(String Middlename) {
        this.Middlename = Middlename;
    }

    public void setSex(String Sex) {
        this.Sex = Sex;
    }

    public void setCivilstatus(String Civilstatus) {
        this.Civilstatus = Civilstatus;
    }

    public void setHousenumber(int Housenumber) {
        this.Housenumber = Housenumber;
    }

    public void setStreet(String Street) {
        this.Street = Street;
    }

    public void setBaranggay(String Baranggay) {
        this.Baranggay = Baranggay;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public void setProvince(String Province) {
        this.Province = Province;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setAge(int Age) {
        this.Age = Age;
    }

    public void setBirthdate(String Birthdate) {
        this.Birthdate = Birthdate;
    }

    public void setPhonenumber(String Phonenumber) {
        this.Phonenumber = Phonenumber;
    }

}
