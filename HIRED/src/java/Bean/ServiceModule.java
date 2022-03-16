package Bean;

import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Scanner;

public class ServiceModule {

    private static Scanner scanner;

    public static void main(String[] args) {

        scanner = new Scanner(System.in);
        System.out.println("=========Welcome to Service Module=========\n");
        while (true) {
            System.out.println("Select Data Table:\n\t1 -> Category\n\t2 -> Service\n\t3 -> Available Service\n\t4 -> Exit Application");
            int dataChoice = Integer.parseInt(scanner.nextLine());
            switch (dataChoice) {
                case 1:
                    categoryOperation();
                    break;
                case 2:
                    serviceOperation();
                    break;
                case 3:
                    availableServiceOperation();
                    break;
                case 4:
                    System.out.println("=========Exit Service Module=========");
                    System.exit(0);
                default:
                    System.out.println("Invalid Option... Please Try again\n");
                    break;
            }
        }
    }

    private static void categoryOperation() {
        scanner = new Scanner(System.in);
        boolean breakWhile = false;
        System.out.println("=========Welcome to Category Section=========\n");
        String categoryId, categoryName, description;
        do {
            System.out.println("Select Data Table:\n\t1 -> Display\n\t2 -> Add\n\t3 -> Modify\n\t4 -> Delete\n\t5 -> Exit Section\n");
            int dataChoice = Integer.parseInt(scanner.nextLine());
            switch (dataChoice) {
                case 1:
                    System.out.print("Enter Category ID: ");
                    categoryId = scanner.nextLine();
                    try {
                        Category category = Category.getCategory(categoryId);
                        if (category != null)
                            category.displayCategory();
                        else
                            System.out.println("\nNo Category Found...\n");
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 2:
                    System.out.print("Enter Category ID: ");
                    categoryId = scanner.nextLine();
                    System.out.print("Enter Category Name: ");
                    categoryName = scanner.nextLine();
                    System.out.print("Enter Description: ");
                    description = scanner.nextLine();
                    try {
                        Category category = new Category(categoryId, categoryName, description);
                        if (category.addCategory())
                            System.out.println("\nCategory Added...\n");
                        else
                            System.out.println("\nCategory couldn't Added...\n");
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 3:
                    System.out.print("Enter Category ID: ");
                    categoryId = scanner.nextLine();
                    System.out.print("Enter Category Name: ");
                    categoryName = scanner.nextLine();
                    System.out.print("Enter Description: ");
                    description = scanner.nextLine();
                    try {
                        Category category = Category.getCategory(categoryId);
                        if (category != null) {
                            category.setCategoryName(categoryName);
                            category.setDescription(description);
                            if (category.updateCategory())
                                System.out.println("\nCategory Updated...\n");
                            else
                                System.out.println("\nCategory couldn't Updated...\n");
                        } else {
                            System.out.println("\nNo Category Found...\n");
                        }

                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 4:
                    System.out.print("Enter Category ID: ");
                    categoryId = scanner.nextLine();
                    try {
                        Category category = Category.getCategory(categoryId);
                        if (category != null) {
                            if (category.deleteCategory())
                                System.out.println("\nCategory Deleted...\n");
                            else
                                System.out.println("\nCategory couldn't Deleted...\n");
                        } else {
                            System.out.println("\nNo Category Found...\n");
                        }
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 5:
                    breakWhile = true;
                    System.out.println("=========Exit Category Section=========");
                    break;
                default:
                    System.out.println("\nInvalid Option... Please Try again\n");
                    break;
            }
        } while (!breakWhile);
    }

    private static void serviceOperation() {
        scanner = new Scanner(System.in);
        boolean breakWhile = false;
        System.out.println("=========Welcome to Service Section=========\n");
        String serviceId, serviceName, description, categoryId;
        int count;
        do {
            System.out.println("Select Data Table:\n\t1 -> Display\n\t2 -> Add\n\t3 -> Modify\n\t4 -> Delete\n\t5 -> Increment Count\n\t6 -> Decrement Count\n\t7 -> Exit Section\n");
            int dataChoice = Integer.parseInt(scanner.nextLine());
            switch (dataChoice) {
                case 1:
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    try {
                        Service service = Service.getService(serviceId);
                        if (service != null)
                            service.displayService();
                        else
                            System.out.println("\nNo Service Found...\n");
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 2:
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    System.out.print("Enter Service Name: ");
                    serviceName = scanner.nextLine();
                    System.out.print("Enter Description: ");
                    description = scanner.nextLine();
                    System.out.print("Enter Category ID: ");
                    categoryId = scanner.nextLine();
                    System.out.print("Enter Count: ");
                    count = Integer.parseInt(scanner.nextLine());
                    try {
                        Service service = new Service(serviceId, serviceName, description, categoryId, count);
                        if (service.addService())
                            System.out.println("\nService Added...\n");
                        else
                            System.out.println("\nService couldn't Added...\n");
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 3:
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    System.out.print("Enter Service Name: ");
                    serviceName = scanner.nextLine();
                    System.out.print("Enter Description: ");
                    description = scanner.nextLine();
                    System.out.print("Enter Category ID: ");
                    categoryId = scanner.nextLine();
                    System.out.print("Enter Count: ");
                    count = Integer.parseInt(scanner.nextLine());
                    try {
                        Service service = Service.getService(serviceId);
                        if (service != null) {
                            service.setServiceName(serviceName);
                            service.setDescription(description);
                            service.setCategoryId(categoryId);
                            service.setCount(count);
                            if (service.updateService())
                                System.out.println("\nService Updated...\n");
                            else
                                System.out.println("\nService couldn't Updated...\n");
                        } else {
                            System.out.println("\nNo Service Found...\n");
                        }

                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 4:
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    try {
                        Service service = Service.getService(serviceId);
                        if (service != null) {
                            if (service.deleteService())
                                System.out.println("\nService Deleted...\n");
                            else
                                System.out.println("\nService couldn't Deleted...\n");
                        } else {
                            System.out.println("\nNo Service Found...\n");
                        }
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 5:
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    try {
                        Service service = Service.getService(serviceId);
                        if (service != null) {
                            if (service.incrementServiceCount())
                                System.out.println("\nService count incremented...\n");
                            else
                                System.out.println("\nService count couldn't be incremented...\n");
                        } else {
                            System.out.println("\nNo Service Found...\n");
                        }
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 6:
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    try {
                        Service service = Service.getService(serviceId);
                        if (service != null) {
                            if (service.decrementServiceCount())
                                System.out.println("\nService count decremented...\n");
                            else
                                System.out.println("\nService count couldn't be decremented...\n");
                        } else {
                            System.out.println("\nNo Service Found...\n");
                        }
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 7:
                    breakWhile = true;
                    System.out.println("=========Exit Service Section=========\n");
                    break;
                default:
                    System.out.println("\nInvalid Option... Please Try again\n");
                    break;
            }
        } while (!breakWhile);
    }

    private static void availableServiceOperation() {
        scanner = new Scanner(System.in);
        boolean breakWhile = false;
        System.out.println("=========Welcome to Available Service Section=========\n");
        String userId, serviceId, workingDays, serviceName;
        Time timeFrom, timeTo;
        float rating;
        boolean availability;
        do {
            System.out.println("Select Data Table:\n\t0 -> Search By User\n\t1 -> Search By Name\n\t2 -> Display\n\t3 -> Add\n\t4 -> Modify\n\t5 -> Delete\n\t6 -> Enable Availability\n\t7 -> Disable Availability\n\t8 -> Exit Section");
            int dataChoice = Integer.parseInt(scanner.nextLine());
            switch (dataChoice) {
                case 0:
                    System.out.print("Enter User ID: \n");
                    userId = scanner.nextLine();
                    try {
                        ArrayList<AvailableService> availableServices = AvailableService.searchServiceByUser(userId);
                        if (availableServices.size() > 0) {
                            for (AvailableService service : availableServices) {
                                service.displayService();
//                                System.out.println(service.getServiceId());
                            }
                            System.out.println();

                        } else
                            System.out.println("No Service Found...\n");
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 1:
                    System.out.print("Enter Service Name: \n");
                    serviceName = scanner.nextLine();
                    try {
                        ArrayList<AvailableService> availableServices = AvailableService.searchService(serviceName);
                        if (availableServices.size() > 0) {
                            for (AvailableService service : availableServices) {
//                                service.displayService();
                                System.out.println(service.getUserId());
                            }
                            System.out.println();

                        } else
                            System.out.println("No Service Found...\n");
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 2:
                    System.out.print("Enter User ID: ");
                    userId = scanner.nextLine();
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    try {
                        AvailableService service = AvailableService.getService(userId, serviceId);
                        if (service != null)
                            service.displayService();
                        else
                            System.out.println("\nNo Service Found...\n");
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 3:
                    System.out.print("Enter User ID: ");
                    userId = scanner.nextLine();
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    System.out.print("Enter Availability (T/F) : ");
                    availability = scanner.nextLine().charAt(0) == 'T';
                    System.out.print("Enter Time from: ");
                    timeFrom = Time.valueOf(scanner.nextLine());
                    System.out.print("Enter Time To: ");
                    timeTo = Time.valueOf(scanner.nextLine());
                    System.out.print("Enter Working Days: ");
                    workingDays = scanner.nextLine();
                    System.out.print("Enter Rating: ");
                    rating = Integer.parseInt(scanner.nextLine());
                    try {
                        AvailableService service = new AvailableService(userId, serviceId, availability, timeFrom, timeTo, workingDays, rating);
                        if (service.addService())
                            System.out.println("\nService Added...\n");
                        else
                            System.out.println("\nService couldn't Added...\n");
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 4:
                    System.out.print("Enter User ID: ");
                    userId = scanner.nextLine();
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    System.out.print("Enter Availability (T/F) : ");
                    availability = scanner.nextLine().charAt(0) == 'T';
                    System.out.print("Enter Time from: ");
                    timeFrom = Time.valueOf(scanner.nextLine());
                    System.out.print("Enter Time To: ");
                    timeTo = Time.valueOf(scanner.nextLine());
                    System.out.print("Enter Working Days: ");
                    workingDays = scanner.nextLine();
                    System.out.print("Enter Rating: ");
                    rating = Integer.parseInt(scanner.nextLine());
                    try {
                        AvailableService service = AvailableService.getService(userId, serviceId);
                        if (service != null) {
                            service.setAvailability(availability);
                            service.setTimeFrom(timeFrom);
                            service.setTimeTo(timeTo);
                            service.setWorkingDays(workingDays);
                            service.setRating(rating);
                            if (service.updateService())
                                System.out.println("\nService Updated...\n");
                            else
                                System.out.println("\nService couldn't Updated...\n");
                        } else {
                            System.out.println("\nNo Service Found...\n");
                        }

                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 5:
                    System.out.print("Enter User ID: ");
                    userId = scanner.nextLine();
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    try {
                        AvailableService service = AvailableService.getService(userId, serviceId);
                        if (service != null) {
                            if (service.deleteService())
                                System.out.println("\nService Deleted...\n");
                            else
                                System.out.println("\nService couldn't Deleted...\n");
                        } else {
                            System.out.println("\nNo Service Found...\n");
                        }
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 6:
                    System.out.print("Enter User ID: ");
                    userId = scanner.nextLine();
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    try {
                        AvailableService service = AvailableService.getService(userId, serviceId);
                        if (service != null) {
                            if (service.enableAvailability())
                                System.out.println("\nService availability enabled...\n");
                            else
                                System.out.println("\nService availability couldn't be enabled...\n");
                        } else {
                            System.out.println("\nNo Service Found...\n");
                        }
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("Connection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 7:
                    System.out.print("Enter User ID: ");
                    userId = scanner.nextLine();
                    System.out.print("Enter Service ID: ");
                    serviceId = scanner.nextLine();
                    try {
                        AvailableService service = AvailableService.getService(userId, serviceId);
                        if (service != null) {
                            if (service.disableAvailability())
                                System.out.println("\nService availability disabled...\n");
                            else
                                System.out.println("\nService availability couldn't be disabled...\n");
                        } else {
                            System.out.println("\nNo Service Found...\n");
                        }
                    } catch (SQLException throwable) {
                        System.out.println("\nSQL Exception:" + throwable.getLocalizedMessage() + "\n");
                        throwable.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        System.out.println("\nConnection Failed...\n");
                        e.printStackTrace();
                    }
                    break;
                case 8:
                    breakWhile = true;
                    System.out.println("\n=========Exit Available Service Section=========\n");
                    break;
                default:
                    System.out.println("\nInvalid Option... Please Try again\n");
                    break;
            }
        } while (!breakWhile);

    }

}
