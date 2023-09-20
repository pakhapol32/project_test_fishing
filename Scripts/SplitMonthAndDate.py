
class SplitMonthAndDate:
    ROBOT_LIBRARY_SCOPE = 'TEST CASE'

    def str_to_int(self, strnum):
        return int(strnum)

    def split_month_and_date(self, month_and_date):
        x = month_and_date.split(" ")
        return x

    def split_str_by_slash(self, inputStr):
        x = inputStr.split("/")
        return x

    def split_str_by_space(self, inputStr):
        x = inputStr.split(" ")
        return x

    def convert_month_to_number(self, month):
        result = 0
        if month == "January":
            result = 1
        elif month == "February":
            result = 2
        elif month == "March":
            result = 3
        elif month == "April":
            result = 4
        elif month == "May":
            result = 5
        elif month == "June":
            result = 6
        elif month == "July":
            result = 7
        elif month == "August":
            result = 8
        elif month == "September":
            result = 9
        elif month == "October":
            result = 10
        elif month == "November":
            result = 11
        elif month == "December":
            result = 12
        return result