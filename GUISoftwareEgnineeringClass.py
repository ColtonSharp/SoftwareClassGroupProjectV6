from tkinter import *
from tkinter import messagebox
from tkinter.ttk import Progressbar
from tkinter import filedialog


window = Tk()

window.title("SEO COMP LIST")

window.geometry('350x200')

lbl = Label(window, text="Your Domain Name:")

lbl.grid(column=0, row=1)

txt = Entry(window, width=10)

txt.grid(column=1, row=1)


def clicked():
    messagebox.showinfo('Warning', 'Please Make Sure to Input Domain has it is on Google')


btn = Button(window, text="Click Me", command=clicked)

btn.grid(column=2, row=1)
#file = filedialog.askopenfilename()
window.mainloop()


