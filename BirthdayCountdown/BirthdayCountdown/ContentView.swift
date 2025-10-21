//
//  ContentView.swift
//  BirthdayCountdown
//
//  Created by Claude
//

import SwiftUI

struct ContentView: View {
    @State private var birthDate = Date()
    @State private var daysUntilBirthday: Int?
    @State private var showingResult = false

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Birthday Countdown")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)

                VStack(spacing: 20) {
                    Text("When is your birthday?")
                        .font(.title2)
                        .foregroundColor(.secondary)

                    DatePicker(
                        "Select your birth date",
                        selection: $birthDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                }
                .padding(.horizontal)

                Button(action: calculateDaysUntilBirthday) {
                    Text("Calculate Days Left")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(15)
                }
                .padding(.horizontal)

                if showingResult, let days = daysUntilBirthday {
                    VStack(spacing: 10) {
                        if days == 0 {
                            Text("🎉 Happy Birthday! 🎉")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        } else {
                            Text("\(days)")
                                .font(.system(size: 80, weight: .bold))
                                .foregroundColor(.blue)

                            Text(days == 1 ? "day until your birthday!" : "days until your birthday!")
                                .font(.title2)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .transition(.scale.combined(with: .opacity))
                }

                Spacer()
            }
            .navigationBarHidden(true)
        }
    }

    func calculateDaysUntilBirthday() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        // Get the month and day from the selected birth date
        let birthComponents = calendar.dateComponents([.month, .day], from: birthDate)

        // Get the current year
        let currentYear = calendar.component(.year, from: today)

        // Create the next birthday date
        var nextBirthdayComponents = DateComponents()
        nextBirthdayComponents.year = currentYear
        nextBirthdayComponents.month = birthComponents.month
        nextBirthdayComponents.day = birthComponents.day

        guard var nextBirthday = calendar.date(from: nextBirthdayComponents) else {
            return
        }

        // If the birthday has already passed this year, use next year
        if nextBirthday < today {
            nextBirthdayComponents.year = currentYear + 1
            nextBirthday = calendar.date(from: nextBirthdayComponents)!
        }

        // Calculate the difference in days
        let components = calendar.dateComponents([.day], from: today, to: nextBirthday)

        withAnimation(.spring()) {
            daysUntilBirthday = components.day
            showingResult = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
