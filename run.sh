#change txt to csv file for easier minupulation
import csv
import pandas as pd

txt_file = r"mytestfile.txt"
csv_file = r"input.csv"

in_txt = csv.reader(open(txt_file, "r+"), delimiter = '|')
out_csv = csv.writer(open(csv_file, 'wb'))

out_csv.writerows(in_txt)

#parse information and create median values by zip file

df = pd.read_csv('input.csv', header=None)
df = df.groupby(11).agg({0:'first', 15:'median', 16:'first'})
df.to_csv(r'medianvals_by_zip.txt', header=None, sep='|', mode='a')

#parse information and create median values by date file

df = pd.read_csv('input.csv', header=None)
df = df.groupby(14).agg({0:'first', 15:'median', 16:'first'})
df.to_csv(r'medianvals_by_date.txt', header=None, sep='|', mode='a')

