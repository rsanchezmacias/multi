# Multi - Multiplication Practice App

An iOS app that allows users to practive multiplication tables while keeping track of their user score and the time taken to answer the questions.

## App Structure

The app is organized into three main sections:

### 1. Introduction
- Welcome screen with app overview

### 2. Practice Setup
- Table selection (2-12)
- Number of questions selection

### 3. Practice Session
- Question display with timer
- Answer input
- Progress tracking
- Results summary with score and time taken

## Technical Overview

The app follows the MVVM (Model-View-ViewModel) architecture pattern:

- **Models**: Question, Option
- **Views**: IntroductionView, MainView, QuestionView, ResultView
- **ViewModels**: MainViewModel

Built with SwiftUI and designed for iOS, the app provides a smooth, native experience while maintaining a simple and focused learning environment. 