package Bean;

import Utility.DatabaseConnection;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class IProfile {

    public static final String IMAGE_FOLDER = "C:\\Projects\\Java_Projects\\HIRED\\build\\web\\v1.0.0\\images";
    public static final String PROFILE_PREVIEW = "profile_preview.png";
    
    private Part profileImagePart;

    private String accountName, accountEmail, accountPassword, accountSummary,
            personalDpFile, personalGender, personalPhone, personalDOB, personalAddress, personalCity, personalState, personalPINCode,
            educationFieldStudy, educationDegree, educationCity, educationState, educationSchoolName, educationGraduationDate, educationStillGraduating, educationResumeFile,
            workJobTitle, workCompanyName, workJobLocation, workExperienceYear, workStillWorking, workJobDescription;
    private PreparedStatement stmt;
    private Connection connection;

    public IProfile() {

    }

    public IProfile(HttpServletRequest request) {
        extractProfile(request);
    }

    public static String getProfileImagePath(String userId) {
        try {
            String sqlQuery = "SELECT DpPictureFile FROM iprofile WHERE Email = ? ;";
            Connection connection = DatabaseConnection.initializeDatabase();
            PreparedStatement statement = connection.prepareStatement(sqlQuery);
            statement.setString(1, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String fileName = resultSet.getString("DpPictureFile");
                return fileName == null?PROFILE_PREVIEW:fileName;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return PROFILE_PREVIEW;
    }

    public static IProfile getProfileById(String userId) {
        IProfile profile = new IProfile();
        if (profile.getProfile(userId).equals("profile_found")) {
            return profile;
        }
        return null;
    }

    public String getProfile(String userEmail) {
        try {
            String sqlString = "SELECT * from iprofile WHERE Email = ?";
            connection = DatabaseConnection.initializeDatabase();
            stmt = connection.prepareStatement(sqlString);
            stmt.setString(1, userEmail);
            ResultSet resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                accountName = resultSet.getString("UserName");
                accountEmail = resultSet.getString("Email");
                accountSummary = resultSet.getString("PersonalSummary");
                personalDpFile = resultSet.getString("DpPictureFile");
                personalGender = resultSet.getString("Gender");
                personalPhone = resultSet.getString("Phone");
                personalDOB = String.valueOf(resultSet.getString("DateOfBirth"));
                personalAddress = resultSet.getString("Address");
                personalCity = resultSet.getString("City");
                personalState = resultSet.getString("State");
                personalPINCode = resultSet.getString("PINCode");
                educationFieldStudy = resultSet.getString("StudyField");
                educationDegree = resultSet.getString("Degree");
                educationCity = resultSet.getString("EduCity");
                educationState = resultSet.getString("EduState");
                educationSchoolName = resultSet.getString("SchoolName");
                educationGraduationDate = String.valueOf(resultSet.getString("GraduationDate"));
                educationResumeFile = resultSet.getString("ResumeFile");
                workJobTitle = resultSet.getString("JobTitle");
                workCompanyName = resultSet.getString("CompanyName");
                workJobLocation = resultSet.getString("CompanyLocation");
                workExperienceYear = resultSet.getString("YearExperience");
                workJobDescription = resultSet.getString("JobDesc");

                return "profile_found";
            } else {
                return "profile_norecord";
            }
        } catch (Exception e) {
            return "profile_error";
        }
    }

    public void extractProfile(HttpServletRequest request) {
        accountName = request.getParameter("account-name");
        accountEmail = request.getParameter("account-email");
        accountPassword = request.getParameter("account-password");
        accountSummary = request.getParameter("account-summary");
        personalDpFile = request.getParameter("personal-dp-picture");
        personalGender = request.getParameter("personal-gender");
        personalPhone = request.getParameter("personal-phone");
        personalDOB = request.getParameter("personal-dob");
        personalAddress = request.getParameter("personal-address");
        personalCity = request.getParameter("personal-city");
        personalState = request.getParameter("personal-state");
        personalPINCode = request.getParameter("personal-pincode");
        educationFieldStudy = request.getParameter("education-study-field");
        educationDegree = request.getParameter("education-degree");
        educationCity = request.getParameter("education-city");
        educationState = request.getParameter("education-state");
        educationSchoolName = request.getParameter("education-school-name");
        educationGraduationDate = request.getParameter("education-graduation-date");
        educationStillGraduating = request.getParameter("education-stillgraduating");
        educationResumeFile = request.getParameter("education-resume-file");
        workJobTitle = request.getParameter("work-job-title");
        workCompanyName = request.getParameter("work-company-name");
        workJobLocation = request.getParameter("work-job-location");
        workExperienceYear = request.getParameter("work-experience-year");
        workStillWorking = request.getParameter("work-still-working");
        workJobDescription = request.getParameter("work-job-description");

        try {
            profileImagePart = request.getPart("personal-dp-picture");
            if (profileImagePart != null) {
                String fileName = getFileName(profileImagePart);
                if (fileName.isEmpty()) {
                    return;
                }
                String fileExt = getExtension(fileName);
                String filePath = IMAGE_FOLDER + File.separator + accountEmail + fileExt;
                personalDpFile = accountEmail + fileExt;
                
                InputStream inputStream = null;
                OutputStream outputStream = null;
                File outputFilePath = new File(filePath);
                inputStream = profileImagePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                inputStream.close();
                outputStream.close();

            } else {
                System.out.println("Image Null");
                personalDpFile = null;
            }
        } catch (IOException | ServletException ex) {
            System.out.println("Image Error");
            ex.printStackTrace();
            personalDpFile = null;
        }
    }

    public String addProfile() {
        try {
            String sqlQuery = "INSERT INTO IProfile (Email,UserName,PersonalSummary,DpPictureFile,Gender,Phone,DateOfBirth,Address,City,State,PINCode,StudyField,Degree,EduCity,EduState,SchoolName,GraduationDate,StillGraduating,ResumeFile,JobTitle,CompanyName,CompanyLocation,YearExperience,StillWorking,JobDesc,updated_at)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP);";
            connection = DatabaseConnection.initializeDatabase();
            stmt = connection.prepareStatement(sqlQuery);
            setValue(1, accountEmail);
            setValue(2, accountName);
            setValue(3, accountSummary);
            setValue(4, personalDpFile);
            setValue(5, personalGender);
            setValue(6, personalPhone);
            setValue(7, personalDOB);
            setValue(8, personalAddress);
            setValue(9, personalCity);
            setValue(10, personalState);
            setValue(11, personalPINCode);
            setValue(12, educationFieldStudy);
            setValue(13, educationDegree);
            setValue(14, educationCity);
            setValue(15, educationState);
            setValue(16, educationSchoolName);
            setValue(17, educationGraduationDate);
            stmt.setBoolean(18, educationStillGraduating != null);
            setValue(19, educationResumeFile);
            setValue(20, workJobTitle);
            setValue(21, workCompanyName);
            setValue(22, workJobLocation);
            setValue(23, workExperienceYear);
            stmt.setBoolean(24, workStillWorking != null);
            setValue(25, workJobDescription);

            boolean profileUpdated = stmt.executeUpdate() > 0;

            sqlQuery = " UPDATE user SET UserName = ?, Password = ? WHERE EmailID = ? ;";
            stmt.clearParameters();
            stmt = connection.prepareStatement(sqlQuery);
            stmt.setString(1, accountName);
            stmt.setString(2, accountPassword);
            stmt.setString(3, accountEmail);
            boolean userUpdated = stmt.executeUpdate() > 0;

            return (profileUpdated) ? "profile_success" : "profile_fail";
        } catch (Exception e) {
            e.printStackTrace();
            return "profile_error";
        }
    }

    public String updateProfile() {
        try {
            String sqlQuery = "UPDATE IProfile SET UserName=?,PersonalSummary=?,DpPictureFile=?,Gender=?,Phone=?,DateOfBirth=?,Address=?,City=?,State=?,PINCode=?,StudyField=?,Degree=?,EduCity=?,EduState=?,SchoolName=?,GraduationDate=?,StillGraduating=?,ResumeFile=?,JobTitle=?,CompanyName=?,CompanyLocation=?,YearExperience=?,StillWorking=?,JobDesc=? WHERE Email = ?;";
            connection = DatabaseConnection.initializeDatabase();
            stmt = connection.prepareStatement(sqlQuery);
            setValue(1, accountName);
            setValue(2, accountSummary);
            setValue(3, personalDpFile);
            setValue(4, personalGender);
            setValue(5, personalPhone);
            setValue(6, personalDOB);
            setValue(7, personalAddress);
            setValue(8, personalCity);
            setValue(9, personalState);
            setValue(10, personalPINCode);
            setValue(11, educationFieldStudy);
            setValue(12, educationDegree);
            setValue(13, educationCity);
            setValue(14, educationState);
            setValue(15, educationSchoolName);
            setValue(16, educationGraduationDate);
            stmt.setBoolean(17, educationStillGraduating != null);
            setValue(18, educationResumeFile);
            setValue(19, workJobTitle);
            setValue(20, workCompanyName);
            setValue(21, workJobLocation);
            setValue(22, workExperienceYear);
            stmt.setBoolean(23, workStillWorking != null);
            setValue(24, workJobDescription);
            setValue(25, accountEmail);

            boolean profileUpdated = stmt.executeUpdate() > 0;

            sqlQuery = " UPDATE user SET UserName = ?, Password = ? WHERE EmailID = ? ;";
            stmt.clearParameters();
            stmt = connection.prepareStatement(sqlQuery);
            stmt.setString(1, accountName);
            stmt.setString(2, accountPassword);
            stmt.setString(3, accountEmail);
            boolean userUpdated = stmt.executeUpdate() > 0;

            return (profileUpdated) ? "profile_success" : "profile_fail";
        } catch (Exception e) {
            e.printStackTrace();
            return "profile_error";
        }
    }

    public void setValue(int index, String inputValue) {
        try {
            if (inputValue == null || inputValue.equals("")) {
                stmt.setNull(index, Types.NULL);
            } else {
                stmt.setString(index, inputValue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setValue(int index, java.sql.Date inputValue) {
        try {
            if (inputValue == null) {
                stmt.setNull(index, Types.NULL);
            } else {
                stmt.setDate(index, inputValue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "profile_preview.png";
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountEmail() {
        return accountEmail;
    }

    public void setAccountEmail(String accountEmail) {
        this.accountEmail = accountEmail;
    }

    public String getAccountPassword() {
        return accountPassword;
    }

    public void setAccountPassword(String accountPassword) {
        this.accountPassword = accountPassword;
    }

    public String getAccountSummary() {
        return accountSummary;
    }

    public void setAccountSummary(String accountSummary) {
        this.accountSummary = accountSummary;
    }

    public String getPersonalDpFile() {
        return personalDpFile;
    }

    public void setPersonalDpFile(String personalDpFile) {
        this.personalDpFile = personalDpFile;
    }

    public String getPersonalGender() {
        return personalGender;
    }

    public void setPersonalGender(String personalGender) {
        this.personalGender = personalGender;
    }

    public String getPersonalPhone() {
        return personalPhone;
    }

    public void setPersonalPhone(String personalPhone) {
        this.personalPhone = personalPhone;
    }

    public String getPersonalDOB() {
        return personalDOB;
    }

    public void setPersonalDOB(String personalDOB) {
        this.personalDOB = personalDOB;
    }

    public String getPersonalAddress() {
        return personalAddress;
    }

    public void setPersonalAddress(String personalAddress) {
        this.personalAddress = personalAddress;
    }

    public String getPersonalCity() {
        return personalCity;
    }

    public void setPersonalCity(String personalCity) {
        this.personalCity = personalCity;
    }

    public String getPersonalState() {
        return personalState;
    }

    public void setPersonalState(String personalState) {
        this.personalState = personalState;
    }

    public String getPersonalPINCode() {
        return personalPINCode;
    }

    public void setPersonalPINCode(String personalPINCode) {
        this.personalPINCode = personalPINCode;
    }

    public String getEducationFieldStudy() {
        return educationFieldStudy;
    }

    public void setEducationFieldStudy(String educationFieldStudy) {
        this.educationFieldStudy = educationFieldStudy;
    }

    public String getEducationDegree() {
        return educationDegree;
    }

    public void setEducationDegree(String educationDegree) {
        this.educationDegree = educationDegree;
    }

    public String getEducationCity() {
        return educationCity;
    }

    public void setEducationCity(String educationCity) {
        this.educationCity = educationCity;
    }

    public String getEducationState() {
        return educationState;
    }

    public void setEducationState(String educationState) {
        this.educationState = educationState;
    }

    public String getEducationSchoolName() {
        return educationSchoolName;
    }

    public void setEducationSchoolName(String educationSchoolName) {
        this.educationSchoolName = educationSchoolName;
    }

    public String getEducationGraduationDate() {
        return educationGraduationDate;
    }

    public void setEducationGraduationDate(String educationGraduationDate) {
        this.educationGraduationDate = educationGraduationDate;
    }

    public String getEducationStillGraduating() {
        return educationStillGraduating;
    }

    public void setEducationStillGraduating(String educationStillGraduating) {
        this.educationStillGraduating = educationStillGraduating;
    }

    public String getEducationResumeFile() {
        return educationResumeFile;
    }

    public void setEducationResumeFile(String educationResumeFile) {
        this.educationResumeFile = educationResumeFile;
    }

    public String getWorkJobTitle() {
        return workJobTitle;
    }

    public void setWorkJobTitle(String workJobTitle) {
        this.workJobTitle = workJobTitle;
    }

    public String getWorkCompanyName() {
        return workCompanyName;
    }

    public void setWorkCompanyName(String workCompanyName) {
        this.workCompanyName = workCompanyName;
    }

    public String getWorkJobLocation() {
        return workJobLocation;
    }

    public void setWorkJobLocation(String workJobLocation) {
        this.workJobLocation = workJobLocation;
    }

    public String getWorkExperienceYear() {
        return workExperienceYear;
    }

    public void setWorkExperienceYear(String workExperienceYear) {
        this.workExperienceYear = workExperienceYear;
    }

    public String getWorkStillWorking() {
        return workStillWorking;
    }

    public void setWorkStillWorking(String workStillWorking) {
        this.workStillWorking = workStillWorking;
    }

    public String getWorkJobDescription() {
        return workJobDescription;
    }

    public void setWorkJobDescription(String workJobDescription) {
        this.workJobDescription = workJobDescription;
    }

    private String getExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }
}
