
package operatordb;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ResourceBundle;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;
import javax.swing.JOptionPane;


public class FXMLDocumentController implements Initializable {
    
    @FXML
    private TableColumn<UserData, String> TableCol_Phonenumber;

    @FXML
    private TableColumn<UserData, String> col_id;

    @FXML
    private TableColumn<UserData, String> TableCol_City;

    @FXML
    private TableColumn<UserData, String> TableCol_Civilstatus;

    @FXML
    private TableColumn<UserData, String> TableCol_Birthdate;

    @FXML
    private TableColumn<UserData, String> TableCol_Firstname;

    @FXML
    private TableColumn<UserData, Integer> TableCol_Housenumber;

    @FXML
    private TableColumn<UserData, String> TableCol_Sex;

    @FXML
    private TableColumn<UserData, String> TableCol_Province;

    @FXML
    private TableColumn<UserData, String> TableCol_Baranggay;

    @FXML
    private TableColumn<UserData, String> TableCol_Middlename;

    @FXML
    private TableColumn<UserData, String> TableCol_Street;

    @FXML
    private TableColumn<UserData, String> TableCol_Lastname;

    @FXML
    private TableColumn<UserData, Integer> TableCol_Age;
    
    @FXML
    private TableView<UserData> User;

    @FXML
    private Button btnAdd; 
      
    @FXML
    private Button btnUpdate;
    
    @FXML
    private Button btnDelete;
    
    @FXML
    private Button btnClear;
    
    @FXML
    private Button btnClose;

    @FXML
    private Button searchBtn;
    
    @FXML
    private TextField text_Street;
    
    @FXML
    private TextField text_id;
    
    @FXML
    private TextField text_Middlename;

    @FXML
    private DatePicker text_Birthdate;
    
    @FXML
    private TextField text_Sex;

    @FXML
    private TextField text_Housenumber;

    @FXML
    private TextField text_Civilstatus;

    @FXML
    private TextField text_City;

    @FXML
    private TextField text_Firstname;
    
    @FXML
    private TextField text_Phonenumber;
     
    @FXML
    private TextField text_Lastname;

    @FXML
    private TextField text_Province;

    @FXML
    private TextField text_Age;

    @FXML
    private TextField text_Baranggay;
    
    @FXML
    private TextField searchBar;


    ObservableList<UserData>listM;
    ObservableList<UserData>searchData;
    
    int index =-1;
    Connection conn = null;
    ResultSet rs =null;
    PreparedStatement ps = null;
    
    @FXML
    void getSelected (javafx.scene.input.MouseEvent event){
        
        index = User.getSelectionModel().getSelectedIndex();
        if (index <= -1){
            return;
        }
        
        text_id.setText(col_id.getCellData(index).toString());
        text_Firstname.setText(TableCol_Firstname.getCellData(index).toString());
        text_Lastname.setText(TableCol_Lastname.getCellData(index).toString());
        text_Middlename.setText(TableCol_Middlename.getCellData(index).toString());
        text_Age.setText(TableCol_Age.getCellData(index).toString());
        text_Birthdate.setValue(LocalDate.parse(TableCol_Birthdate.getCellData(index)));
        text_Sex.setText(TableCol_Sex.getCellData(index).toString());
        text_Phonenumber.setText(TableCol_Phonenumber.getCellData(index).toString());
        text_Civilstatus.setText(TableCol_Civilstatus.getCellData(index).toString());
        text_Housenumber.setText(TableCol_Housenumber.getCellData(index).toString());
        text_Street.setText(TableCol_Street.getCellData(index).toString());
        text_Baranggay.setText(TableCol_Baranggay.getCellData(index).toString());
        text_City.setText(TableCol_City.getCellData(index).toString());
        text_Province.setText(TableCol_Province.getCellData(index).toString());
      
    }
    
    @FXML
    public void operatorSearch(){

        col_id.setCellValueFactory(new PropertyValueFactory<UserData,String>("id"));
        TableCol_Lastname.setCellValueFactory( new PropertyValueFactory<UserData,String>("Lastname"));
        TableCol_Firstname.setCellValueFactory( new PropertyValueFactory<UserData,String>("Firstname")); 
        TableCol_Middlename.setCellValueFactory( new PropertyValueFactory<UserData,String>("Middlename"));  
        TableCol_Sex.setCellValueFactory( new PropertyValueFactory<UserData,String>("Sex")); 
        TableCol_Civilstatus.setCellValueFactory( new PropertyValueFactory<UserData,String>("Civilstatus")); 
        TableCol_Housenumber.setCellValueFactory( new PropertyValueFactory<UserData,Integer>("Housenumber"));
        TableCol_Street.setCellValueFactory( new PropertyValueFactory<UserData,String>("Street")); 
        TableCol_Baranggay.setCellValueFactory(new PropertyValueFactory<UserData,String>("Baranggay"));
        TableCol_City.setCellValueFactory( new PropertyValueFactory<UserData,String>("City"));   
        TableCol_Province.setCellValueFactory( new PropertyValueFactory<UserData,String>("Province"));    
        TableCol_Age.setCellValueFactory( new PropertyValueFactory<UserData,Integer>("Age"));
        TableCol_Birthdate.setCellValueFactory( new PropertyValueFactory<UserData,String>("Birthdate"));
        TableCol_Phonenumber.setCellValueFactory( new PropertyValueFactory<UserData,String>("Phonenumber"));

        searchData = sqlconnect.getdata();
        User.setItems(searchData);
        
        FilteredList<UserData> filteredData = new FilteredList<>(searchData,b-> true);   
        searchBar.textProperty().addListener((observableValue,oldValue,newValue)->{
        filteredData.setPredicate(operator ->{
                if(newValue == null || newValue.isEmpty()){
                    return true;
                }
                String upcase = newValue.toUpperCase();
                
                if(operator.getId().toUpperCase().indexOf(upcase) != -1){
                    return true;
                }
                else if(operator.getLastname().toUpperCase().indexOf(upcase) != -1){
                    return true;
                }
                else if(operator.getFirstname().toUpperCase().indexOf(upcase) != -1){
                    return true;
                }
                else if(operator.getMiddlename().toUpperCase().indexOf(upcase) != -1){
                    return true;
                }
               
                else
                    return false;
            });
        });
        
        SortedList<UserData> sortData = new SortedList<>(filteredData);
        sortData.comparatorProperty().bind(User.comparatorProperty());
        User.setItems(sortData);
    }
    
    @FXML
    public void edit(){
        conn = sqlconnect.connect_DB();
        if(text_Street.getText().isEmpty()||text_id.getText().isEmpty()||text_Middlename.getText().isEmpty()||
           text_City.getText().isEmpty()||text_Birthdate.getValue().equals(null)||text_Housenumber.getText().isEmpty()||
           text_Sex.getText().isEmpty()||text_Civilstatus.getText().isEmpty()||text_Firstname.getText().isEmpty()||
           text_Phonenumber.getText().isEmpty()||text_Lastname.getText().isEmpty()||text_Province.getText().isEmpty() ||
           text_Age.getText().isEmpty()||text_Baranggay.getText().isEmpty())
        {
            JOptionPane.showMessageDialog(null, "Text fields cannot be blank");
        }
        else{
       try {
           
           String op_id = text_id.getText();
           String fname = text_Firstname.getText();
           String lname = text_Lastname.getText();
           String mname = text_Middlename.getText();
           String age = text_Age.getText();
           String bdate = text_Birthdate.getValue().toString();
           String sex = text_Sex.getText();
           String pnum = text_Phonenumber.getText();
           String cstatus = text_Civilstatus.getText();
           String hnum = text_Housenumber.getText();
           String street = text_Street.getText();
           String brgy = text_Baranggay.getText();
           String city = text_City.getText();
           String pov = text_Province.getText();
           
           
           String sql = "UPDATE Operator SET Operator_id='" + op_id 
                        + "',Firstname='" + fname
                        + "',Lastname='" + lname 
                        + "',Middlename='" + mname 
                        + "',Age='" + age 
                        + "',Birthdate='" + bdate 
                        + "',Sex='" + sex 
                        + "',[phone_number]='" + pnum 
                        + "',Civil_status='" + cstatus 
                        + "',[House_number]='" + hnum 
                        + "',Street='" + street
                        + "',Barangay='" + brgy 
                        + "',City='" + city 
                        + "',Province='" + pov 
                        + "'WHERE Operator_id='"+op_id +"'";
                        
                        ps = conn.prepareStatement(sql);
                        ps.execute();
                        
                        refreshTable();
                        clearBtnOnAction();
                        JOptionPane.showMessageDialog(null, "Update Successfully");
                
           } catch (Exception e){
           
           JOptionPane.showMessageDialog(null, "Failed to update data");
       }
     }
    }
    
    @FXML
    public void addButton(){
        conn = sqlconnect.connect_DB();
        
        String sql = "INSERT INTO Operator (Lastname,Firstname,Middlename,Sex,Civil_status,House_number,Street,Barangay,City,Province,Operator_id,Age,Birthdate,phone_number) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        if(text_Lastname.getText().isEmpty()||text_Firstname.getText().isEmpty()||text_Middlename.getText().isEmpty()||text_Sex.getText().isEmpty() ||
           text_Civilstatus.getText().isEmpty()||text_Housenumber.getText().isEmpty()||text_Street.getText().isEmpty()||text_Baranggay.getText().isEmpty()||
           text_City.getText().isEmpty()||text_Province.getText().isEmpty()||text_id.getText().isEmpty()||text_Age.getText().isEmpty()||
           text_Birthdate.getValue().equals(null)||text_Phonenumber.getText().isEmpty())
        {
            JOptionPane.showMessageDialog(null, "Text fields cannot be blank");
        }
          else{
            try{
                ps = conn.prepareStatement(sql);
                ps.setString(1, text_Lastname.getText());
                ps.setString(2, text_Firstname.getText());
                ps.setString(3, text_Middlename.getText());
                ps.setString(4, text_Sex.getText());
                ps.setString(5, text_Civilstatus.getText());
                ps.setInt(6, Integer.parseInt(text_Housenumber.getText()));
                ps.setString(7, text_Street.getText());
                ps.setString(8, text_Baranggay.getText());
                ps.setString(9, text_City.getText());
                ps.setString(10, text_Province.getText());
                ps.setString(11, text_id.getText());
                ps.setInt(12, Integer.parseInt(text_Age.getText()));
                ps.setString(13, text_Birthdate.getValue().toString());
                ps.setString(14, text_Phonenumber.getText());
                ps.execute();
            
                clearBtnOnAction();
                refreshTable();
                JOptionPane.showMessageDialog(null, "Data Added Successfully");
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, "Failed to add new data");
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            }
        }
    }
    
    @FXML
    private void handleButtonAction(ActionEvent event) {
    }
    
    @FXML
    public void clearBtnOnAction(){
        text_Street.clear();
        text_id.clear();
        text_Middlename.clear();
        text_City.clear();
        text_Birthdate.setValue(LocalDate.now());
        text_Housenumber.clear();
        text_Sex.clear();
        text_Civilstatus.clear();
        text_Firstname.clear();
        text_Phonenumber.clear();
        text_Lastname.clear();
        text_Province.clear();
        text_Age.clear();
        text_Baranggay.clear();

    }
    

    public void refreshTable(){
        
        col_id.setCellValueFactory(new PropertyValueFactory<UserData,String>("id"));
        TableCol_Lastname.setCellValueFactory( new PropertyValueFactory<UserData,String>("Lastname"));
        TableCol_Firstname.setCellValueFactory( new PropertyValueFactory<UserData,String>("Firstname")); 
        TableCol_Middlename.setCellValueFactory( new PropertyValueFactory<UserData,String>("Middlename"));  
        TableCol_Sex.setCellValueFactory( new PropertyValueFactory<UserData,String>("Sex")); 
        TableCol_Civilstatus.setCellValueFactory( new PropertyValueFactory<UserData,String>("Civilstatus")); 
        TableCol_Housenumber.setCellValueFactory( new PropertyValueFactory<UserData,Integer>("Housenumber"));
        TableCol_Street.setCellValueFactory( new PropertyValueFactory<UserData,String>("Street")); 
        TableCol_Baranggay.setCellValueFactory(new PropertyValueFactory<UserData,String>("Baranggay"));
        TableCol_City.setCellValueFactory( new PropertyValueFactory<UserData,String>("City"));   
        TableCol_Province.setCellValueFactory( new PropertyValueFactory<UserData,String>("Province"));    
        TableCol_Age.setCellValueFactory( new PropertyValueFactory<UserData,Integer>("Age"));
        TableCol_Birthdate.setCellValueFactory( new PropertyValueFactory<UserData,String>("Birthdate"));
        TableCol_Phonenumber.setCellValueFactory( new PropertyValueFactory<UserData,String>("Phonenumber"));
        
        listM = sqlconnect.getdata();
        User.setItems(listM);
    }
    @FXML
    public void closeButtonOnAction(ActionEvent event){
        Stage stage = (Stage) btnClose.getScene().getWindow();
        stage.close();
    }
    
    @FXML
    public void deleteBtnOnAction(){
        conn = sqlconnect.connect_DB();
        String sql = "DELETE FROM Operator WHERE Operator_id = ?";
        
        try{
            ps = conn.prepareStatement(sql);
            ps.setString(1, text_id.getText());
            ps.execute();
            JOptionPane.showMessageDialog(null, "Data Deleted Successfully");

        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, "Failed to delete data");
            System.err.println(e.getClass().getName() + ": " + e.getMessage()); 
        }
            clearBtnOnAction();
            refreshTable();
        
    }
   
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        refreshTable();
        operatorSearch();
        
        
    }    
    
}
