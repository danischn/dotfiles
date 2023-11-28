import tkinter as tk
from subprocess import call

class MinimalLauncher:
    def __init__(self, master):
        self.master = master
        master.title("VimLauncher")

        self.entry = tk.Entry(master)
        self.entry.pack(pady=10)
        self.entry.bind("<Return>", self.launch_app)

    def launch_app(self, event):
        app_name = self.entry.get()
        call(["open", "-a", app_name])
        self.master.destroy()

if __name__ == "__main__":
    root = tk.Tk()
    launcher = MinimalLauncher(root)
    root.mainloop()
