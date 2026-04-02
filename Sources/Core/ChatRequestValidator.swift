// ============================================================================
// ChatRequestValidator.swift — Shared validation for chat completion requests
// Part of ApfelCore — pure request validation, no HTTP/framework dependency
// ============================================================================

import Foundation

public enum UnsupportedChatParameter: String, Sendable, Equatable {
    case logprobs
    case n
    case stop
    case presencePenalty = "presence_penalty"
    case frequencyPenalty = "frequency_penalty"

    public var name: String { rawValue }

    public var message: String {
        switch self {
        case .logprobs:
            return "Parameter 'logprobs' is not supported by Apple's on-device model."
        case .n:
            return "Parameter 'n' is not supported by Apple's on-device model. Only n=1 is allowed."
        case .stop:
            return "Parameter 'stop' is not supported by Apple's on-device model."
        case .presencePenalty:
            return "Parameter 'presence_penalty' is not supported by Apple's on-device model."
        case .frequencyPenalty:
            return "Parameter 'frequency_penalty' is not supported by Apple's on-device model."
        }
    }

    public static func detect(in request: ChatCompletionRequest) -> UnsupportedChatParameter? {
        if request.logprobs == true {
            return .logprobs
        }
        if let count = request.n, count != 1 {
            return .n
        }
        if request.stop != nil {
            return .stop
        }
        if request.presence_penalty != nil {
            return .presencePenalty
        }
        if request.frequency_penalty != nil {
            return .frequencyPenalty
        }
        return nil
    }
}

public enum ChatRequestValidationFailure: Sendable, Equatable {
    case emptyMessages
    case unsupportedParameter(UnsupportedChatParameter)
    case invalidLastRole
    case imageContent

    public var message: String {
        switch self {
        case .emptyMessages:
            return "'messages' must contain at least one message"
        case .unsupportedParameter(let parameter):
            return parameter.message
        case .invalidLastRole:
            return "Last message must have role 'user' or 'tool'"
        case .imageContent:
            return "Image content is not supported by the Apple on-device model"
        }
    }

    public var event: String {
        switch self {
        case .emptyMessages:
            return "validation failed: empty messages"
        case .unsupportedParameter(let parameter):
            return "validation failed: unsupported parameter \(parameter.name)"
        case .invalidLastRole:
            return "validation failed: last role != user/tool"
        case .imageContent:
            return "rejected: image content"
        }
    }
}

public enum ChatRequestValidator {
    public static func validate(_ request: ChatCompletionRequest) -> ChatRequestValidationFailure? {
        guard !request.messages.isEmpty else {
            return .emptyMessages
        }

        if let unsupported = UnsupportedChatParameter.detect(in: request) {
            return .unsupportedParameter(unsupported)
        }

        guard let lastRole = request.messages.last?.role, ["user", "tool"].contains(lastRole) else {
            return .invalidLastRole
        }

        if request.messages.contains(where: \.containsImageContent) {
            return .imageContent
        }

        return nil
    }
}
