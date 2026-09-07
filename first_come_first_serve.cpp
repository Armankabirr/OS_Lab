#include <bits/stdc++.h>
using namespace std;

struct Process {
    int id, at, bt, ct, wt, tat;
};

void printGantt(vector<pair<int,int>> gantt, int startTime) {
    cout << "\nGantt Chart:\n|";

    for(auto &g : gantt)
        cout << " P" << g.first << " |";

    cout << "\n" << startTime;

    for(auto &g : gantt)
        cout << setw(5) << g.second;
    // setw(5) forces the next output to take up at least n characters by padding it with spaces.

    cout << endl;
}

int main() {
    int n;
    cout << "Enter number of processes: ";
    cin >> n;

    vector<Process> p(n);

    for(int i = 0; i < n; i++) {
        p[i].id = i + 1;
        cout << "Enter AT and BT for P" << i + 1 << ": ";
        cin >> p[i].at >> p[i].bt;
    }

    // Sort according to arrival time.
    // If arrival times are equal, use process ID.
    sort(p.begin(), p.end(), [](Process a, Process b) {
        if(a.at != b.at)
            return a.at < b.at;
        return a.id < b.id;
    });

    int time = 0;
    vector<pair<int,int>> gantt;

    for(int i = 0; i < n; i++) {

        // CPU remains idle until the next process arrives.
        if(time < p[i].at)
            time = p[i].at;

        time += p[i].bt;

        p[i].ct = time;
        p[i].tat = p[i].ct - p[i].at;
        p[i].wt = p[i].tat - p[i].bt;

        gantt.push_back({p[i].id, time});
    }

    printGantt(gantt, p[0].at);

    cout << "\nPID\tAT\tBT\tCT\tTAT\tWT\n";

    double totalWT = 0, totalTAT = 0;

    for(auto &x : p) {
        cout << "P" << x.id << "\t"
             << x.at << "\t"
             << x.bt << "\t"
             << x.ct << "\t"
             << x.tat << "\t"
             << x.wt << endl;

        totalWT += x.wt;
        totalTAT += x.tat;
    }

    cout << fixed << setprecision(2);
    cout << "\nAverage Waiting Time: "
         << totalWT / n << endl;

    cout << "Average Turnaround Time: "
         << totalTAT / n << endl;

    return 0;
}